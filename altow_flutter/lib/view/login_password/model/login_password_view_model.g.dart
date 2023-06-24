// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPasswordViewModel on _LoginPasswordViewModelBase, Store {
  late final _$errorPinAtom =
      Atom(name: '_LoginPasswordViewModelBase.errorPin', context: context);

  @override
  bool get errorPin {
    _$errorPinAtom.reportRead();
    return super.errorPin;
  }

  @override
  set errorPin(bool value) {
    _$errorPinAtom.reportWrite(value, super.errorPin, () {
      super.errorPin = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_LoginPasswordViewModelBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginPasswordViewModelBase.login', context: context);

  @override
  Future<void> login(
      {required String password, required BuildContext context}) {
    return _$loginAsyncAction
        .run(() => super.login(password: password, context: context));
  }

  late final _$_LoginPasswordViewModelBaseActionController =
      ActionController(name: '_LoginPasswordViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_LoginPasswordViewModelBaseActionController
        .startAction(name: '_LoginPasswordViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_LoginPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorPin: ${errorPin}
    ''';
  }
}
