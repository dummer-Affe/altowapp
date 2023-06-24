import 'dart:io';

import '/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/navigation/navigation_enums.dart';
import '../../../product/init/enum/login_provider_type_enum.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final List<ProviderType> _socials = [
    ProviderType.google,
    ProviderType.facebook,
    if (Platform.isIOS) ProviderType.apple
  ];

  List<ProviderType> get socials => _socials;

  @observable
  String description = '';

  @observable
  bool isLoginProcess = false;

  @observable
  bool isLoginWithEmail = false;

  @action
  void setIsEmailLogin(bool isLoginWithEmail) {
    this.isLoginWithEmail = isLoginWithEmail;
  }

  Future<void> login(
      {required ProviderType loginProviderType,
      required BuildContext context}) async {
    switch (loginProviderType) {
      case ProviderType.facebook:
        break;
      case ProviderType.google:
        break;
      case ProviderType.apple:
        break;
      case ProviderType.mobile:
        NavigationService.push(NavigationEnums.mobilePhoneNumberLogin);
        break;
    }
  }
}
