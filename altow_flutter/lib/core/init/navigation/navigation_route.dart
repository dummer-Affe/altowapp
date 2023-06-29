import 'package:flutter/cupertino.dart';

import '/core/init/navigation/navigation_service.dart';
import '/view/date_of_birth/view/date_of_birth_view.dart';
import '/view/login/view/login_view.dart';
import '/view/login_password/view/login_password_view.dart';
import '/view/mobile_phone_number_login/view/mobile_phone_number_view.dart';
import '/view/otp/view/otp_view.dart';
import '/view/register_email/view/register_email_view.dart';
import '/view/set_password/view/set_password_view.dart';
import '/view/story_detail/view/story_detail_view.dart';
import '../../../view/home_base/view/home_base_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../../view/webview_page/view/webview_page_view.dart';
import 'fade_route.dart';
import 'navigation_enums.dart';
import 'navigation_extentions.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    
    switch (getNavigationEnum(routeSettings.name)) {
      case NavigationEnums.splash:
        return _normalNavigate(const SplashView());

      case NavigationEnums.login:
        return _normalNavigate(const LoginView());

      case NavigationEnums.mobilePhoneNumberLogin:
        return _normalNavigate(const MobilePhoneNumberView());

      case NavigationEnums.registerEmail:
        return _normalNavigate(const RegisterEmailView());

      case NavigationEnums.dateOfBirth:
        return _normalNavigate(const DateOfBirthView());

      case NavigationEnums.setPassword:
        return _fadeRouteNavigate(const SetPasswordView());

      case NavigationEnums.otp:
        return _fadeRouteNavigate(const OtpView());

      case NavigationEnums.loginPassword:
        return _normalNavigate(const LoginPasswordView());

      case NavigationEnums.homebase:
        return _normalNavigate(HomeBaseView());

      case NavigationEnums.storyDetail:
        int? id = NavigationService.instance.data as int?;
        return _normalNavigate(StoryDetailView(storyID: id));

      case NavigationEnums.webviewPage:
        String? url = NavigationService.instance.data as String?;
        return _normalNavigate(WebviewPage(url: url));

      default:
        throw Exception('$this not found');
    }
  }

  CupertinoPageRoute _normalNavigate(Widget widget,
      {RouteSettings? settings, bool isFullScreen = false}) {
    return CupertinoPageRoute(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: isFullScreen);
  }

  PageRoute _fadeRouteNavigate(Widget widget, {RouteSettings? settings}) {
    return FadeRoute(page: widget, settings: settings);
  }
}
