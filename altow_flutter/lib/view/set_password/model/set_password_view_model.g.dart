// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetPasswordViewModel on _SetPasswordViewModelBase, Store {
  late final _$rule1Atom =
      Atom(name: '_SetPasswordViewModelBase.rule1', context: context);

  @override
  InputRule? get rule1 {
    _$rule1Atom.reportRead();
    return super.rule1;
  }

  @override
  set rule1(InputRule? value) {
    _$rule1Atom.reportWrite(value, super.rule1, () {
      super.rule1 = value;
    });
  }

  late final _$rule2Atom =
      Atom(name: '_SetPasswordViewModelBase.rule2', context: context);

  @override
  InputRule? get rule2 {
    _$rule2Atom.reportRead();
    return super.rule2;
  }

  @override
  set rule2(InputRule? value) {
    _$rule2Atom.reportWrite(value, super.rule2, () {
      super.rule2 = value;
    });
  }

  late final _$errorPinAtom =
      Atom(name: '_SetPasswordViewModelBase.errorPin', context: context);

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
      Atom(name: '_SetPasswordViewModelBase._isLoading', context: context);

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

  late final _$_SetPasswordViewModelBaseActionController =
      ActionController(name: '_SetPasswordViewModelBase', context: context);

  @override
  void pinChanged(String pin) {
    final _$actionInfo = _$_SetPasswordViewModelBaseActionController
        .startAction(name: '_SetPasswordViewModelBase.pinChanged');
    try {
      return super.pinChanged(pin);
    } finally {
      _$_SetPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_SetPasswordViewModelBaseActionController
        .startAction(name: '_SetPasswordViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_SetPasswordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rule1: ${rule1},
rule2: ${rule2},
errorPin: ${errorPin}
    ''';
  }
}
