import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/widgets/bottom_sheet/error_bottom_sheet.dart';

part 'webview_page_model_view.g.dart';

class WebviewPageModelView = _WebviewPageModelViewBase
    with _$WebviewPageModelView;

abstract class _WebviewPageModelViewBase with Store {
  @observable
  WebViewController? controller;

  String? url;
  bool isInit = true;
  Future<void> init(String? url) async {
    this.url = url;
    await setupController();
  }

  @action
  Future<void> setupController() async {
    controller = null;
    if (!isInit) {
      await Future.delayed(const Duration(seconds: 1));
    }
    isInit = false;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            ErrorBottomSheet.listenConnection(
                context: AppSettings.instance.context!,
                onConnected: () {
                  setupController();
                });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url ?? ""));
  }
}
