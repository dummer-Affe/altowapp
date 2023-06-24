// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/product/model/login/login_parameter.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/extensions/response_model.dart';
import '../../../product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'login_password_view_model.g.dart';

class LoginPasswordViewModel = _LoginPasswordViewModelBase
    with _$LoginPasswordViewModel;

abstract class _LoginPasswordViewModelBase with Store {
  @observable
  bool errorPin = false;

  @observable
  bool _isLoading = false;

  bool _isProcessing = false;

  @action
  Future<void> login(
      {required String password, required BuildContext context}) async {
    var tracker = RegistrationTracker.instance;
    await doIfThereIsNoProcess(() async {
      errorPin = false;
      if (password.length == 6) {
        _changeLoading();
        var response = await AppSettings.instance.generalService.login(
            LoginParameter(username: tracker.mobilePhone, password: password));
        _changeLoading();
        switch (response.responseType) {
          case ResponseType.hasData:
            tracker.login(token: response.data!.token, context: context);
            break;
          case ResponseType.errorModelWithData:
            ErrorBottomSheet.customView(
                title: "Something Went Wrong",
                message:
                    "A problem was encountered while logging into the application.",
                context: context);
            break;
          case ResponseType.errorModelWithoutData:
            ErrorBottomSheet.customView(
                title: "Something Went Wrong",
                message:
                    "A problem was encountered while logging into the application.",
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
      } else {
        errorPin = true;
      }
    });
  }

  Future<void> doIfThereIsNoProcess(dynamic Function() process) async {
    if (!_isProcessing) {
      _isProcessing = true;
      await process();
      _isProcessing = false;
    }
    return;
  }

  Future<void> forgetPassword(BuildContext context) async {
    var tracker = RegistrationTracker.instance;

    
    var response = await AppSettings.instance.otpService
        .checkUserNecessarySendOtp(
            OtpCheckerParameter.newPassword(mobilePhone: tracker.mobilePhone));
    switch (response.responseType) {
      case ResponseType.hasData:
        tracker.forgetPassword(context: context);
        break;
      case ResponseType.errorModelWithData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong",
            context: context);
        break;
      case ResponseType.errorModelWithoutData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong while connecting our servers",
            context: context);
        break;
      case ResponseType.noConnection:
        ErrorBottomSheet.listenConnection(context: context, onConnected: () {});
        break;
      case ResponseType.unknown:
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }

  Future<void> forgetPhone(BuildContext context) async {
    RegistrationTracker.instance.forgetPhone(context);
  }

  @action
  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
