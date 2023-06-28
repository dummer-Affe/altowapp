// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/product/model/check_user/check_user_parameter.dart';
import '/product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '../../core/init/navigation/navigation_enums.dart';
import '../../core/init/navigation/navigation_service.dart';
import '../../core/states/app_settings/app_settings.dart';
import '../../core/states/app_user/app_user.dart';
import '../../core/states/app_user/auth_user.dart';
import '../../product/init/enum/login_provider_type_enum.dart';
import '../../product/init/extensions/response_model.dart';
import '../../product/model/user_information/user_information.dart';
import '../../product/widgets/bottom_sheet/error_bottom_sheet.dart';
import 'otp_type.dart';

class RegistrationTracker extends GetxController {
  String? mobilePhone, email, password, providerId, id;
  DateTime? dateTime;
  ProviderType type;
  bool? isRegistration;
  String? latestOtpCode;
  OtpType? otpTarget;
  UserInformation? userInformation;
  RegistrationTracker(this.type) {
    _clean();
  }

  static RegistrationTracker get instance => Get.find<RegistrationTracker>();

  void _clean() {
    mobilePhone = null;
    id = null;
    dateTime = null;
    email = null;
    password = null;
    providerId = null;
    isRegistration = null;
    latestOtpCode = null;
  }

  void disposeTracker() {
    _clean();
    GetInstance().delete<RegistrationTracker>();
  }

  /* ---------------------------------REGISTER PROCESS START----------------------------------- */

  static void startRegistrationProcess(
      {required ProviderType type, required Map<String, dynamic> data}) {
    late RegistrationTracker instance;
    if (GetInstance().isRegistered<RegistrationTracker>()) {
      instance = RegistrationTracker.instance;
      instance._clean();
      instance.type = type;
    } else {
      instance = Get.put(RegistrationTracker(type));
    }
    instance.isRegistration = true;
    if (type == ProviderType.mobile) {
      instance.enterMobilePhone(
          mobilePhone: data['mobilePhone'], context: data['context']);
    } else {
      instance.userInformation = data['userInformation'];
      instance.providerId = data['providerId'];
    }
  }

  void enterMobilePhone(
      {required String mobilePhone, required BuildContext context}) {
    this.mobilePhone = mobilePhone;
    otpTarget = OtpType.phone;
    NavigationService.push(NavigationEnums.otp);
  }

  Future<void> setOtp(
      {required String otp, required BuildContext context}) async {
    latestOtpCode = otp;

    switch (otpTarget!) {
      case OtpType.phone:
        var response = await AppSettings.instance.generalService
            .checkUser(CheckUserParameter(phoneNumber: mobilePhone));

        switch (response.responseType) {
          case ResponseType.hasData:
            if (response.data?.data == false) {
              isRegistration = true;
              NavigationService.pushRemoveUntil(NavigationEnums.registerEmail);
            } else {
              isRegistration = false;
              NavigationService.pushRemoveUntil(NavigationEnums.loginPassword);
            }
            break;
          case ResponseType.errorModelWithData:
            
            ErrorBottomSheet.customView(
                title: "Something Went Wrong",
                message: "Something went wrong while connecting our servers",
                context: context);
            break;
          case ResponseType.errorModelWithoutData:
         
            ErrorBottomSheet.customView(
                title: "Something Went Wrong",
                message: "Something went wrong while connecting our servers",
                context: context);
            break;
          case ResponseType.noConnection:
        
            ErrorBottomSheet.listenConnection(
                context: context, onConnected: () {});
            break;
          case ResponseType.unknown:
            
            ErrorBottomSheet.unknownErr(context: context);
            break;
        }

        break;
      case OtpType.email:
        NavigationService.pushRemoveUntil(NavigationEnums.dateOfBirth);
        break;
      case OtpType.renewPassword:
        NavigationService.pushRemoveUntil(NavigationEnums.setPassword);
        break;
    }
  }

  setDate({required BuildContext context, required DateTime dateTime}) {
    this.dateTime = dateTime;
    NavigationService.pushRemoveUntil(NavigationEnums.setPassword);
  }

  void registerEmail({required String email, required BuildContext context}) {
    this.email = email;
    otpTarget = OtpType.email;
    NavigationService.push(NavigationEnums.otp);
  }

  void setPassword(String password, BuildContext context) {
    this.password = password;
    NavigationService.push(NavigationEnums.setPassword);
  }

  Future<void> register({required BuildContext context}) async {
    if (type == ProviderType.mobile) {
      await AppUser.instance.register(
          AuthUserInformations(mobilePhone: mobilePhone, email: email));
      RegistrationTracker.startLoginProcess(
          context: context,
          type: ProviderType.mobile,
          withoutOtp: true,
          data: {'mobilePhone': mobilePhone, 'email': email});
    } else {
      await AppUser.instance
          .register(AuthUserInformations(email: userInformation?.email));
    }
  }

  /* ---------------------------------REGISTER PROCESS END----------------------------------- */

  /* ---------------------------------COMMON FUNCTİONS----------------------------------------*/

  Future<bool> onWillPop(
      {required NavigationEnums page, required BuildContext context}) async {
    switch (page) {
      case NavigationEnums.registerEmail:
        NavigationService.pushRemoveUntil(
            NavigationEnums.mobilePhoneNumberLogin);
        return false;
      case NavigationEnums.otp:
        return true;
      case NavigationEnums.dateOfBirth:
        NavigationService.pushRemoveUntil(
            NavigationEnums.mobilePhoneNumberLogin);
        return false;
      case NavigationEnums.setPassword:
        if (password == null && isRegistration == true) {
          NavigationService.pushRemoveUntil(NavigationEnums.registerEmail);
        } else if (password == null && isRegistration != true) {
          NavigationService.pushRemoveUntil(NavigationEnums.loginPassword);
        } else {
          password = null;
          Navigator.pop(context);
        }
        return false;
      default:
        return true;
    }
  }

  void passwordDoesntMatch(BuildContext context) async {
    ErrorBottomSheet.customView(
        title: "Does not match",
        message:
            "Your phone number must be full filled Please write your number full filled!",
        isDismissible: false,
        onSubmitBtnPressed: () {
          password = null;
          NavigationService.pushRemoveUntil(NavigationEnums.setPassword);
        },
        context: context);
  }

  static Future<bool> otpSender(
      {required OtpCheckerParameter parameter,
      String? customErrorTitle,
      String? customErrorMessage,
      required BuildContext context}) async {
    var response = await AppSettings.instance.otpService
        .checkUserNecessarySendOtp(parameter);
    switch (response.responseType) {
      case ResponseType.hasData:
        return true;
      case ResponseType.errorModelWithData:
        ErrorBottomSheet.customView(
            title: customErrorTitle ?? "Something Went Wrong",
            message: customErrorMessage ??
                "Something went wrong while connecting our servers",
            context: context);
        return false;
      case ResponseType.errorModelWithoutData:
        ErrorBottomSheet.customView(
            title: customErrorTitle ?? "Something Went Wrong",
            message: customErrorMessage ??
                "Something went wrong while connecting our servers",
            context: context);
        return false;
      case ResponseType.noConnection:
        ErrorBottomSheet.listenConnection(context: context, onConnected: () {});
        return false;
      case ResponseType.unknown:
        ErrorBottomSheet.unknownErr(context: context);
        return false;
    }
  }

  /* ----------------------------------------------------------------------------------------*/

  /* ---------------------------------LOGIN PROCESS START----------------------------------- */

  static void startLoginProcess(
      {required ProviderType type,
      required BuildContext context,
      required bool withoutOtp,
      required Map<String, dynamic> data}) {
    late RegistrationTracker instance;
    if (GetInstance().isRegistered<RegistrationTracker>()) {
      instance = RegistrationTracker.instance;
      instance._clean();
      instance.type = type;
    } else {
      instance = Get.put(RegistrationTracker(type));
    }
    instance.isRegistration = false;
    if (type == ProviderType.mobile) {
      instance.mobilePhone = data['mobilePhone'];
      instance.email = data['email'];
      if (withoutOtp) {
        NavigationService.pushRemoveUntil(NavigationEnums.loginPassword);
      } else {
        instance.otpTarget = OtpType.phone;
        NavigationService.push(NavigationEnums.otp);
      }
    } else {}
  }

  Future<void> login(
      {required String? token, required BuildContext context}) async {
    if (token == null) {
      ErrorBottomSheet.unknownErr(context: context);
      return;
    }
    if (type == ProviderType.mobile) {
      print(token);
      await AppUser.instance.login(
          informations:
              AuthUserInformations(mobilePhone: mobilePhone, email: email),
          token: token);
      NavigationService.pushRemoveUntil(NavigationEnums.homebase);
    }
  }

  Future<void> forgetPhone(BuildContext context) async {
    await AppUser.instance.logout();
    NavigationService.pushRemoveUntil(NavigationEnums.login);
  }

  Future<void> forgetPassword({required BuildContext context}) async {
    password = null;
    otpTarget = OtpType.renewPassword;
    isRegistration = false;
    NavigationService.push(NavigationEnums.otp);
  }

  Future<void> loginPassword(BuildContext context) async {
    isRegistration = false;
    NavigationService.pushRemoveUntil(NavigationEnums.loginPassword);
  }

  Future<void> renewPassword(BuildContext context) async {
    NavigationService.pushRemoveUntil(NavigationEnums.loginPassword);
  }
}
