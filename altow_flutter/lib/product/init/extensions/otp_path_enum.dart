import '/product/init/enum/otp_services.dart';
import '../../../core/init/network/project_network_manager.dart';

extension GeneralPathExtensions on OtpPathEnum {
  String get _rawValue {
    switch (this) {
      case OtpPathEnum.checkOtp:
        return '/check-otp';
      case OtpPathEnum.sendOtp:
        return '/send-otp';
      case OtpPathEnum.resendOtp:
        return '/re-send-otp';
    }
  }

  String get path {
    return "public$_rawValue";
  }

  String get fullPath {
    return '${ProjectNetworkManager.config.baseUrl}$path';
  }
}
