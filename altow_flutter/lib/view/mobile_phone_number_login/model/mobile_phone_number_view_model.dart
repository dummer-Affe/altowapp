// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/navigation/navigation_enums.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/login_provider_type_enum.dart';
import '../../../product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'mobile_phone_number_view_model.g.dart';

class MobilePhoneNumberViewModel = _MobilePhoneNumberViewModelBase
    with _$MobilePhoneNumberViewModel;

abstract class _MobilePhoneNumberViewModelBase with Store {
  @observable
  bool _isLoading = false;

  @observable
  bool _serverError = false;

  @observable
  String? errorText;

  bool get isLoading => _isLoading;
  bool get serverError => _serverError;

  @action
  bool validateMobile(String value) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!regExp.hasMatch(value)) {
      errorText = 'Enter a valid number!';
      return false;
    }
    errorText = null;
    return true;
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (AppSettings.instance.canPop) {
      Navigator.pop(context);
      return false;
    } else {
      NavigationService.push(NavigationEnums.login);
      return false;
    }
  }

  @action
  Future<void> controlPhoneNumber(
      IntPhoneNumber mobilePhone, BuildContext context) async {
    if (validateMobile(mobilePhone.rawNumber)) {
      _serverError = false;
      _changeLoading();
      var isSuccess = await RegistrationTracker.otpSender(
          parameter:
              OtpCheckerParameter(mobilePhone: mobilePhone.rawFullNumber),
          context: context);
      if (isSuccess) {
        RegistrationTracker.startLoginProcess(
            context: context,
            type: ProviderType.mobile,
            withoutOtp: false,
            data: {'mobilePhone': mobilePhone.rawFullNumber});
      } else {}
    }
  }

  @action
  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
