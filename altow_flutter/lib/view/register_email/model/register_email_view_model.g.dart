// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_email_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterEmailViewModel on _RegisterEmailViewModelBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_RegisterEmailViewModelBase._isLoading', context: context);

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

  late final _$_serverErrorAtom =
      Atom(name: '_RegisterEmailViewModelBase._serverError', context: context);

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

  late final _$_errorTextAtom =
      Atom(name: '_RegisterEmailViewModelBase._errorText', context: context);

  @override
  String? get _errorText {
    _$_errorTextAtom.reportRead();
    return super._errorText;
  }

  @override
  set _errorText(String? value) {
    _$_errorTextAtom.reportWrite(value, super._errorText, () {
      super._errorText = value;
    });
  }

  late final _$controlEmailAddressAsyncAction = AsyncAction(
      '_RegisterEmailViewModelBase.controlEmailAddress',
      context: context);

  @override
  Future<void> controlEmailAddress(String emailAddress, BuildContext context) {
    return _$controlEmailAddressAsyncAction
        .run(() => super.controlEmailAddress(emailAddress, context));
  }

  late final _$_RegisterEmailViewModelBaseActionController =
      ActionController(name: '_RegisterEmailViewModelBase', context: context);

  @override
  bool isValidEmail(String email) {
    final _$actionInfo = _$_RegisterEmailViewModelBaseActionController
        .startAction(name: '_RegisterEmailViewModelBase.isValidEmail');
    try {
      return super.isValidEmail(email);
    } finally {
      _$_RegisterEmailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_RegisterEmailViewModelBaseActionController
        .startAction(name: '_RegisterEmailViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_RegisterEmailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
