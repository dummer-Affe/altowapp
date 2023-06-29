import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/init/navigation/navigation_enums.dart';
import '/core/init/navigation/navigation_extentions.dart';
import '../../states/app_settings/app_settings.dart';

class NavigationService extends GetxController {
  Object? data;
  static NavigationService get init => Get.put(NavigationService());
  static NavigationService get instance => Get.find<NavigationService>();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Future<T?> push<T>(NavigationEnums page,
      {Object? data, dynamic Function()? poppedBack}) async {
    var exPage = AppSettings.instance.currentPage;
    var exContext = AppSettings.instance.context;
    NavigationService.instance.data = data;
    AppSettings.instance.pageStackCount += 1;
    AppSettings.instance.currentPage = page;
    return await NavigationService.instance.navigatorKey.currentState
        ?.pushNamed(page.route, arguments: data)
        .then((value) {
      AppSettings.instance.currentPage = exPage;
      if (exContext != null) {
        AppSettings.instance.updateContext(exContext);
      }
      if (poppedBack != null) poppedBack();
      return null;
    });
  }

  static Future<T?> pushRemoveUntil<T>(NavigationEnums page,
      {Object? data, dynamic Function()? poppedBack}) async {

    AppSettings.instance.pageStackCount = 1;
    AppSettings.instance.currentPage = page;
    return await NavigationService.instance.navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(page.route, (Route<dynamic> route) => false,
            arguments: data);
  }
}
