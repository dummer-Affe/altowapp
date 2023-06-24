// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$descriptionAtom =
      Atom(name: '_LoginViewModelBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$isLoginProcessAtom =
      Atom(name: '_LoginViewModelBase.isLoginProcess', context: context);

  @override
  bool get isLoginProcess {
    _$isLoginProcessAtom.reportRead();
    return super.isLoginProcess;
  }

  @override
  set isLoginProcess(bool value) {
    _$isLoginProcessAtom.reportWrite(value, super.isLoginProcess, () {
      super.isLoginProcess = value;
    });
  }

  late final _$isLoginWithEmailAtom =
      Atom(name: '_LoginViewModelBase.isLoginWithEmail', context: context);

  @override
  bool get isLoginWithEmail {
    _$isLoginWithEmailAtom.reportRead();
    return super.isLoginWithEmail;
  }

  @override
  set isLoginWithEmail(bool value) {
    _$isLoginWithEmailAtom.reportWrite(value, super.isLoginWithEmail, () {
      super.isLoginWithEmail = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void setIsEmailLogin(bool isLoginWithEmail) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setIsEmailLogin');
    try {
      return super.setIsEmailLogin(isLoginWithEmail);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
isLoginProcess: ${isLoginProcess},
isLoginWithEmail: ${isLoginWithEmail}
    ''';
  }
}
