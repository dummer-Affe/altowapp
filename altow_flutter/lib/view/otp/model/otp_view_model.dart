// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';

import '/product/init/extensions/response_model.dart' as responseType;
import '/product/service/otp/otp_service.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/model/check_otp/check_otp_parameter.dart';
import '../../../product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '../../../product/model/error/project_error_model.dart';
import '../../../product/model/resend_otp/resend_otp_parameter.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../tracker/otp_type.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'otp_view_model.g.dart';

class OtpViewModel = _OtpViewModelBase with _$OtpViewModel;

abstract class _OtpViewModelBase with Store {
  final OTPService _otpService = AppSettings.instance.otpService;
  @observable
  bool _isLoading = false;

  @observable
  bool _serverError = false;

  @observable
  int time = 120;

  @observable
  String? errorText;

  String get titleText {
    switch (registrationTracker.otpTarget) {
      case OtpType.email:
        return "Code send to ${registrationTracker.email}";
      case OtpType.phone:
        return "Code send to your number";
      default:
        return "Code send to your number";
    }
  }

  Timer? timer;
  bool get isLoading => _isLoading;
  bool get serverError => _serverError;
  bool get timeFlow => time > 0;
  final registrationTracker = RegistrationTracker.instance;

  void init() {
    startTimer();
  }

  @action
  void startTimer() {
    time = 120;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      if (time <= 0) {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtp(BuildContext context) async {
    _serverError = false;
    errorText = null;
    _changeLoading();
    late IResponseModel<dynamic, ProjectErrorModel?> response;
    if (registrationTracker.otpTarget == OtpType.renewPassword) {
      response = await _otpService.sendOtp(OtpCheckerParameter.newPassword(
          mobilePhone: registrationTracker.mobilePhone));
    } else {
      response = await _otpService.resendOtp(
          registrationTracker.otpTarget == OtpType.phone
              ? ResendOtpParameter.mobile(
                  phoneNumber: registrationTracker.mobilePhone)
              : ResendOtpParameter.email(
                  searchValue: registrationTracker.email,
                  phoneNumber: registrationTracker.mobilePhone));
    }
    _changeLoading();
    switch (response.responseType) {
      case responseType.ResponseType.hasData:
        startTimer();
        break;
      case responseType.ResponseType.errorModelWithData:
        ErrorBottomSheet.customView(
            title: "Invalid OTP code",
            message: "Invalid otp entered",
            context: context);
        break;
      case responseType.ResponseType.errorModelWithoutData:
        ErrorBottomSheet.customView(
            title: "Invalid OTP code",
            message: "Invalid otp entered",
            context: context);
        break;
      case responseType.ResponseType.noConnection:
        ErrorBottomSheet.connectionErr(context: context);
        break;
      case responseType.ResponseType.unknown:
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }

  Future<void> controlOtp(
      {required String otpCode, required BuildContext context}) async {
    _serverError = false;
    errorText = null;
    _changeLoading();
    late CheckOtpParameter parameter;
    switch (registrationTracker.otpTarget) {
      case OtpType.phone:
        parameter = CheckOtpParameter.mobile(
            otpCode: otpCode, phoneNumber: registrationTracker.mobilePhone);
        break;
      case OtpType.renewPassword:
        parameter = CheckOtpParameter.mobile(
            otpCode: otpCode, phoneNumber: registrationTracker.mobilePhone);
        break;
      case OtpType.email:
        parameter = CheckOtpParameter.email(
            otpCode: otpCode,
            email: registrationTracker.email,
            phoneNumber: registrationTracker.mobilePhone);
        break;
      default:
        parameter = CheckOtpParameter.mobile(
            otpCode: otpCode, phoneNumber: registrationTracker.mobilePhone);
        break;
    }
    var response = await _otpService.checkOtp(parameter);

    _changeLoading();
    switch (response.responseType) {
      case responseType.ResponseType.hasData:
        registrationTracker.setOtp(otp: otpCode, context: context);
        break;
      case responseType.ResponseType.errorModelWithData:
        errorText = errorText ?? "Please enter the code sent!";
        break;
      case responseType.ResponseType.errorModelWithoutData:
        errorText = "Please enter the code sent!";
        //ErrorBottomSheet.customView(
        //    title: "Something Went Wrong",
        //    message: "Something went wrong while sending otp",
        //    context: context);
        break;
      case responseType.ResponseType.noConnection:
        ErrorBottomSheet.listenConnection(context: context, onConnected: () {});
        break;
      case responseType.ResponseType.unknown:
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }

  Future<void> controlOtp2(
      {required String otpCode, required BuildContext context}) async {}

  @action
  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
