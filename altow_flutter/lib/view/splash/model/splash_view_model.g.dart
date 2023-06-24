// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$isSetupCompletedAtom =
      Atom(name: '_SplashViewModelBase.isSetupCompleted', context: context);

  @override
  bool get isSetupCompleted {
    _$isSetupCompletedAtom.reportRead();
    return super.isSetupCompleted;
  }

  @override
  set isSetupCompleted(bool value) {
    _$isSetupCompletedAtom.reportWrite(value, super.isSetupCompleted, () {
      super.isSetupCompleted = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_SplashViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
isSetupCompleted: ${isSetupCompleted}
    ''';
  }
}
