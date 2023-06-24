import 'package:device_preview/device_preview.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/init/navigation/navigation_service.dart';
import '/core/states/app_settings/app_settings.dart';
import '/core/states/app_user/app_user.dart';
import 'core/init/navigation/navigation_route.dart';

bool testMode = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Figma.setup(deviceWidth: 375, deviceHeight: 812);

  AppUser.init;
  AppSettings.init();
  runApp(!testMode
      ? const AltowApp()
      : DevicePreview(
          enabled: true,
          builder: (context) => const AltowApp(), // Wrap your app
        ));
}

class AltowApp extends StatelessWidget {
  const AltowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppUser>(builder: (controller) {
      return MaterialApp(
          locale: testMode ? DevicePreview.locale(context) : null,
          builder: testMode ? DevicePreview.appBuilder : null,
          onGenerateRoute: NavigationRoute().generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
          debugShowCheckedModeBanner: false);
    });
  }
}
