// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_stories_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuccessStoriesViewModel on _SuccessStoriesViewModelBase, Store {
  late final _$serviceStatusAtom = Atom(
      name: '_SuccessStoriesViewModelBase.serviceStatus', context: context);

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_SuccessStoriesViewModelBase.init', context: context);

  @override
  Future<void> init({required BuildContext context}) {
    return _$initAsyncAction.run(() => super.init(context: context));
  }

  late final _$goToDetailPageAsyncAction = AsyncAction(
      '_SuccessStoriesViewModelBase.goToDetailPage',
      context: context);

  @override
  Future<void> goToDetailPage(
      {required BuildContext context, required int? id}) {
    return _$goToDetailPageAsyncAction
        .run(() => super.goToDetailPage(context: context, id: id));
  }

  late final _$fetchStoriesAsyncAction = AsyncAction(
      '_SuccessStoriesViewModelBase.fetchStories',
      context: context);

  @override
  Future<void> fetchStories({required BuildContext context}) {
    return _$fetchStoriesAsyncAction
        .run(() => super.fetchStories(context: context));
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus}
    ''';
  }
}
