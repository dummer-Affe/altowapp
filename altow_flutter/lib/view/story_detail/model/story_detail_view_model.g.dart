// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryDetailViewModel on _StoryDetailViewModelBase, Store {
  late final _$serviceStatusAtom =
      Atom(name: '_StoryDetailViewModelBase.serviceStatus', context: context);

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
      AsyncAction('_StoryDetailViewModelBase.init', context: context);

  @override
  Future<void> init({required int? storyId, required BuildContext context}) {
    return _$initAsyncAction
        .run(() => super.init(storyId: storyId, context: context));
  }

  late final _$fetchStoryAsyncAction =
      AsyncAction('_StoryDetailViewModelBase.fetchStory', context: context);

  @override
  Future<void> fetchStory({required BuildContext context}) {
    return _$fetchStoryAsyncAction
        .run(() => super.fetchStory(context: context));
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus}
    ''';
  }
}
