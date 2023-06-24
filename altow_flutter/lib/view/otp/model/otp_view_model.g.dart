// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OtpViewModel on _OtpViewModelBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: '_OtpViewModelBase._isLoading', context: context);

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
      Atom(name: '_OtpViewModelBase._serverError', context: context);

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

  late final _$timeAtom =
      Atom(name: '_OtpViewModelBase.time', context: context);

  @override
  int get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_OtpViewModelBase.errorText', context: context);

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

  late final _$_OtpViewModelBaseActionController =
      ActionController(name: '_OtpViewModelBase', context: context);

  @override
  void startTimer() {
    final _$actionInfo = _$_OtpViewModelBaseActionController.startAction(
        name: '_OtpViewModelBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_OtpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_OtpViewModelBaseActionController.startAction(
        name: '_OtpViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_OtpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
time: ${time},
errorText: ${errorText}
    ''';
  }
}
