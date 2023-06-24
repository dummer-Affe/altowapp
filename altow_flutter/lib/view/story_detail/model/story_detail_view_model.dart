// ignore_for_file: use_build_context_synchronously

import '/product/init/extensions/response_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/model/success_story_response/story_response_model.dart';
import '../../../product/service/auth/auth_service.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';

part 'story_detail_view_model.g.dart';

class StoryDetailViewModel = _StoryDetailViewModelBase
    with _$StoryDetailViewModel;

abstract class _StoryDetailViewModelBase with Store {
  final AuthService _authService = AppSettings.instance.authService;

  SuccessStoryResponse? story;

  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  late int? storyId;

  @action
  Future<void> init(
      {required int? storyId, required BuildContext context}) async {
    this.storyId = storyId;
    await fetchStory(context: context);
  }

  @action
  Future<void> fetchStory({required BuildContext context}) async {
    if (storyId == null) {
      serviceStatus = ServiceStatus.failed;
      return;
    }
    serviceStatus = ServiceStatus.onProcess;
    var response = await _authService.getStory(storyId.toString());

    switch (response.responseType) {
      case ResponseType.hasData:
        serviceStatus = ServiceStatus.success;
        story = response.data!;
        break;

      case ResponseType.errorModelWithData:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong during login process",
            context: context);
        break;

      case ResponseType.errorModelWithoutData:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong during login process",
            context: context);
        break;

      case ResponseType.noConnection:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.listenConnection(
            context: context,
            onConnected: () {
              fetchStory(context: context);
            });
        break;

      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }
}
