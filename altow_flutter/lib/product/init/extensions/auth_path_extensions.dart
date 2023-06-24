import '/product/init/enum/auth_path_enum.dart';
import '../../../core/init/network/project_network_manager.dart';

extension AuthPathExtensions on AuthPathEnum {
  String get _rawValue {
    switch (this) {
      case AuthPathEnum.successStories:
        return '/success-stories';
    }
  }

  String get path {
    return 'auth$_rawValue';
  }

  String get fullPath {
    return '${ProjectNetworkManager.config.baseUrl}$path';
  }
}
