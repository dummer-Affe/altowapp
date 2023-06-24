import 'navigation_enums.dart';

extension NavigationConstantsValue on NavigationEnums {
  String get name {
    switch (this) {
      case NavigationEnums.login:
        return 'login';
      case NavigationEnums.homebase:
        return 'homebase';
      case NavigationEnums.dateOfBirth:
        return 'dateOfBirth';
      case NavigationEnums.loginPassword:
        return 'loginPassword';
      case NavigationEnums.mobilePhoneNumberLogin:
        return 'mobilePhoneNumberLogin';
      case NavigationEnums.otp:
        return 'otp';
      case NavigationEnums.registerEmail:
        return 'registerEmail';
      case NavigationEnums.setPassword:
        return 'setPassword';
      case NavigationEnums.storyDetail:
        return 'storyDetail';
      case NavigationEnums.splash:
        return 'splash';
      case NavigationEnums.webviewPage:
        return 'webview';
    }
  }

  String get route {
    switch (this) {
      case NavigationEnums.splash:
        return '/';
      case NavigationEnums.login:
        return '/login';
      case NavigationEnums.homebase:
        return '/homebase';
      case NavigationEnums.dateOfBirth:
        return '/date-of-birth';
      case NavigationEnums.loginPassword:
        return '/login-password';
      case NavigationEnums.mobilePhoneNumberLogin:
        return '/mobile-phoneNumber-login';
      case NavigationEnums.otp:
        return '/otp';
      case NavigationEnums.registerEmail:
        return '/register-email';
      case NavigationEnums.setPassword:
        return '/set-password';
      case NavigationEnums.storyDetail:
        return '/story-detail';
      case NavigationEnums.webviewPage:
        return '/webview';
    }
  }
}

NavigationEnums getNavigationEnum(String? val) {
  switch (val) {
    case '/':
      return NavigationEnums.splash;

    case '/login':
      return NavigationEnums.login;

    case '/homebase':
      return NavigationEnums.homebase;

    case '/date-of-birth':
      return NavigationEnums.dateOfBirth;

    case '/login-password':
      return NavigationEnums.loginPassword;

    case '/mobile-phoneNumber-login':
      return NavigationEnums.mobilePhoneNumberLogin;

    case '/otp':
      return NavigationEnums.otp;

    case '/register-email':
      return NavigationEnums.registerEmail;

    case '/set-password':
      return NavigationEnums.setPassword;

    case '/story-detail':
      return NavigationEnums.storyDetail;

    case '/webview':
      return NavigationEnums.webviewPage;

    default:
      throw Exception('$val not found');
  }
}
