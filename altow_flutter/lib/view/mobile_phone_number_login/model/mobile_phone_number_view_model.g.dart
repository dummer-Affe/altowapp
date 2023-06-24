// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_phone_number_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobilePhoneNumberViewModel on _MobilePhoneNumberViewModelBase, Store {
  late final _$_isLoadingAtom = Atom(
      name: '_MobilePhoneNumberViewModelBase._isLoading', context: context);

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

  late final _$_serverErrorAtom = Atom(
      name: '_MobilePhoneNumberViewModelBase._serverError', context: context);

  @override
  bool get _serverError {
    _$_serverErrorAtom.reportRead();
    return super._serverError;
  }

  @override
  set _serverError(bool value) {
    _$_serverErrorAtom.reportWrite(value, super._serverError, () {
      super._serverError = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_MobilePhoneNumberViewModelBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$controlPhoneNumberAsyncAction = AsyncAction(
      '_MobilePhoneNumberViewModelBase.controlPhoneNumber',
      context: context);

  @override
  Future<void> controlPhoneNumber(
      IntPhoneNumber mobilePhone, BuildContext context) {
    return _$controlPhoneNumberAsyncAction
        .run(() => super.controlPhoneNumber(mobilePhone, context));
  }

  late final _$_MobilePhoneNumberViewModelBaseActionController =
      ActionController(
          name: '_MobilePhoneNumberViewModelBase', context: context);

  @override
  bool validateMobile(String value) {
    final _$actionInfo = _$_MobilePhoneNumberViewModelBaseActionController
        .startAction(name: '_MobilePhoneNumberViewModelBase.validateMobile');
    try {
      return super.validateMobile(value);
    } finally {
      _$_MobilePhoneNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_MobilePhoneNumberViewModelBaseActionController
        .startAction(name: '_MobilePhoneNumberViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_MobilePhoneNumberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorText: ${errorText}
    ''';
  }
}
