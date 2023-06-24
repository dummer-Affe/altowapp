// ignore_for_file: use_build_context_synchronously

import '/product/model/register/register_parameter.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/extensions/regex_constants.dart';
import '../../../core/init/navigation/navigation_enums.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/extensions/response_model.dart';
import '../../../product/model/renew_password/renew_password_parameter.dart';
import '../../../product/service/general/general_service.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../tracker/user_login_or_register_tracker.dart';
import 'input_rule.dart';

part 'set_password_view_model.g.dart';

class SetPasswordViewModel = _SetPasswordViewModelBase
    with _$SetPasswordViewModel;

abstract class _SetPasswordViewModelBase with Store {
  final RegistrationTracker _tracker = RegistrationTracker.instance;
  final GeneralService _generalService = AppSettings.instance.generalService;

  FocusNode pinFocus = FocusNode();
  String _pin = '';

  @observable
  InputRule? rule1;

  @observable
  InputRule? rule2;

  @observable
  bool errorPin = false;

  @observable
  bool _isLoading = false;

  late bool firstTime;

  String get titleText {
    return firstTime ? 'Enter the password' : "Re-enter the password";
  }

  List<InputRule> get rules => [rule1!, rule2!];

  void init() {
    firstTime = _tracker.password == null ? true : false;
    rule1 = InputRule(
        regex: RegexConstants.consecutiveRegex,
        text: "Can't include more than one consecutive letters or numbers");
    rule2 = InputRule(
        regex: RegexConstants.repeatingRegex,
        text: "The same number cannot occur more than once");
  }

  @action
  void pinChanged(String pin) {
    _pin = pin;
    errorPin = false;
    if (firstTime) {
      rule1 = rule1?.validate(pin);
      rule2 = rule2?.validate(pin);
    }
    if (rule1?.isValid == false || rule2?.isValid == false) {
      errorPin = true;
      pinFocus.requestFocus();
    }
  }

  Future<void> createPin(BuildContext context) async {
    if (_pin.length == 6) {
      if (firstTime) {
        if (rule1?.isValid == true && rule2?.isValid == true) {
          _tracker.setPassword(_pin, context);
        }
      } else {
        if (_pin != _tracker.password) {
          _tracker.passwordDoesntMatch(context);
        } else {
          if (_tracker.isRegistration == true) {
            await _registerPassword(context);
          } else {
            await _renewPassword(context);
          }
        }
      }
    }
  }

  Future<void> _renewPassword(BuildContext context) async {
    _changeLoading();
    var response = await _generalService.renewPassword(RenewPasswordParameter(
        mobileNumber: _tracker.mobilePhone, password: _pin));
    _changeLoading();
    switch (response.responseType) {
      case ResponseType.hasData:
        _tracker.renewPassword(context);
        break;
      case ResponseType.errorModelWithData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong while renew password process",
            context: context);
        break;
      case ResponseType.errorModelWithoutData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong while renew password process",
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

  Future<bool> onWillPop(BuildContext context) async {
    return RegistrationTracker.instance
        .onWillPop(page: NavigationEnums.setPassword, context: context);
  }

  Future<void> _registerPassword(BuildContext context) async {
    _changeLoading();
    var response = await _generalService.register(RegisterParameter(
        mobilePhone: _tracker.mobilePhone,
        password: _pin,
        email: _tracker.email,
        birthdate: _tracker.dateTime.toString()));
    _changeLoading();
    switch (response.responseType) {
      case ResponseType.hasData:
        _tracker.register(context: context);
        break;
      case ResponseType.errorModelWithData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong while register process",
            context: context);
        break;
      case ResponseType.errorModelWithoutData:
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong while register process",
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

  @action
  void _changeLoading() {
    _isLoading = !_isLoading;
  }
}
