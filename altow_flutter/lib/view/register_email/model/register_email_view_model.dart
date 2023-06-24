// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/navigation/navigation_enums.dart';
import '../../../product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'register_email_view_model.g.dart';

class RegisterEmailViewModel = _RegisterEmailViewModelBase
    with _$RegisterEmailViewModel;

abstract class _RegisterEmailViewModelBase with Store {
  @observable
  bool _isLoading = false;

  @observable
  bool _serverError = false;

  @observable
  String? _errorText;

  bool get isLoading => _isLoading;
  String? get errorText => _errorText;
  bool get serverError => _serverError;
  final registrationTracker = RegistrationTracker.instance;

  List<String> get helperEmails =>
      ['@gmail.com', '@hotmail.com', '@icloud.com'];

  @action
  bool isValidEmail(String email) {
    email = email.trim();
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    _errorText = isValid ? null : 'This is not a valid email format';
    return isValid;
  }

  Future<bool> onWillPop(BuildContext context) async {
    return RegistrationTracker.instance
        .onWillPop(page: NavigationEnums.registerEmail, context: context);
  }

  @action
  Future<void> controlEmailAddress(
      String emailAddress, BuildContext context) async {
    emailAddress = emailAddress.trim();
    if (isValidEmail(emailAddress)) {
      _serverError = false;
      _changeLoading();
      var isSuccess = await RegistrationTracker.otpSender(
          parameter: OtpCheckerParameter(
              mobilePhone: registrationTracker.mobilePhone,
              email: emailAddress),
          customErrorTitle: "Something Went Wrong",
          customErrorMessage: "Something went wrong while saving your email",
          context: context);
      _changeLoading();
      if (isSuccess) {
        registrationTracker.registerEmail(
            email: emailAddress, context: context);
      } else {}
    }
  }

  @action
  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
