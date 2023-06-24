// ignore_for_file: use_build_context_synchronously

import '/core/init/navigation/navigation_service.dart';
import '/product/init/extensions/response_model.dart';
import '/product/service/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../core/init/navigation/navigation_enums.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/model/success_stories_response/stories_response_model.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';

part 'success_stories_view_model.g.dart';

class SuccessStoriesViewModel = _SuccessStoriesViewModelBase
    with _$SuccessStoriesViewModel;

abstract class _SuccessStoriesViewModelBase with Store {
  final AuthService _authService = AppSettings.instance.authService;

  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  SuccessStoriesResponse? _stories;

  SuccessStoriesResponse? get stories => _stories;

  @action
  Future<void> init({required BuildContext context}) async {
    await fetchStories(context: context);
  }

  @action
  Future<void> goToDetailPage(
      {required BuildContext context, required int? id}) async {
    if (id == null) {
      ErrorBottomSheet.unknownErr(context: context);
      return;
    }
    NavigationService.push(NavigationEnums.storyDetail, data: id);
  }

  @action
  Future<void> fetchStories({required BuildContext context}) async {
    serviceStatus = ServiceStatus.onProcess;
    var response = await _authService.getStories();

    switch (response.responseType) {
      case ResponseType.hasData:
        serviceStatus = ServiceStatus.success;
        _stories = response.data!;
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
              fetchStories(context: context);
            });
        break;

      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }
}
