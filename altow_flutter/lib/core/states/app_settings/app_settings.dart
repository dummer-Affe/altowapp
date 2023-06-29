import 'package:figma_to_flutter/figma_design_io.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '/product/service/auth/auth_service.dart';
import '/product/service/otp/otp_service.dart';
import '../../../product/service/public_general/general_service.dart';
import '../../../product/utility/shared_manager.dart';
import '../../init/navigation/navigation_enums.dart';
import '../../init/navigation/navigation_service.dart';
import '../app_colors/appearance.dart';

class AppSettings extends GetxController {

  AppSettings() {
    listenInternetConnection();
    _generalService = GeneralService();
    _authService = AuthService();
    _otpService = OTPService();
  }

  late Appearance _appearance;
  late final GeneralService _generalService;
  late final OTPService _otpService;
  late final AuthService _authService;
  late SharedPreferencesManager _sharedPreferencesManager;
  BuildContext? _context;
  late bool _isDeviceConnected;
  NavigationEnums? currentPage;
  int pageStackCount = 1;
  late Figma2Flutter figma;



  BuildContext? get context => _context;
  GeneralService get generalService => _generalService;
  OTPService get otpService => _otpService;
  AuthService get authService => _authService;
  bool get isDeviceConnected => _isDeviceConnected;
  Appearance get appearance => _appearance;
  bool get isDarkMode => _appearance.name=="dark";
  bool get canPop => pageStackCount > 1;
  SharedPreferencesManager get sharedPreferencesManager =>
      _sharedPreferencesManager;
  static AppSettings get instance => Get.find<AppSettings>();


  Future<void> setup() async {
  
    await initSharedReferences();
    String? appearanceName = getAppearanceFromShared() ?? "light";
    if (appearanceName == "light") {
      _appearance = Appearance.light();
    } else {
      _appearance = Appearance.dark();
    }
  }

  void updateFigma(BuildContext context) {
    figma = Figma.of(context);
  }



  void updateContext(BuildContext context) {
    _context = context;
    updateFigma(context);
  }

  //Figma2Flutter get figma => Figma.of(_context!);

  void changeTheme() {
    _appearance =
        appearance.name == "dark" ? Appearance.light() : Appearance.dark();
    update();
  }

  Future<void> checkConnection() async {
    _isDeviceConnected = await InternetConnectionChecker().hasConnection;
  }

  void listenInternetConnection() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _isDeviceConnected = true;
          update();
          break;
        case InternetConnectionStatus.disconnected:
          _isDeviceConnected = false;
          update();
          break;
      }
    });
  }

  Future<void> initSharedReferences() async {
    _sharedPreferencesManager = SharedPreferencesManager();
    await _sharedPreferencesManager.init();
  }

  String? getAppearanceFromShared() {
    return _sharedPreferencesManager.getAppearance;
  }

  Future<void> saveAppearance(String name) async {
    await _sharedPreferencesManager.updateAppearance(name);
  }

  static AppSettings init() {
    NavigationService.init;
    return Get.put(AppSettings());
  }

}
