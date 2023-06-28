import '../../../core/init/network/project_network_manager.dart';
import '../enum/general_path_enum.dart';

extension GeneralPathExtensions on GeneralPathEnum {
  String get _rawValue {
    switch (this) {
      case GeneralPathEnum.register:
        return '/register';
      case GeneralPathEnum.renewPassword:
        return '/renew-password';
      case GeneralPathEnum.login:
        return '/login/version:2';
      case GeneralPathEnum.checkUser:
        return '/check-user';
    }
  }

  String get path {
    return "public$_rawValue";
  }

  String get fullPath {
    return '${ProjectNetworkManager.config.baseUrl}$path';
  }
}
