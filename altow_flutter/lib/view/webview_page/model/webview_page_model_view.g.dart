// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_page_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebviewPageModelView on _WebviewPageModelViewBase, Store {
  late final _$controllerAtom =
      Atom(name: '_WebviewPageModelViewBase.controller', context: context);

  @override
  WebViewController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(WebViewController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$setupControllerAsyncAction = AsyncAction(
      '_WebviewPageModelViewBase.setupController',
      context: context);

  @override
  Future<void> setupController() {
    return _$setupControllerAsyncAction.run(() => super.setupController());
  }

  @override
  String toString() {
    return '''
controller: ${controller}
    ''';
  }
}
