import '/product/init/enum/otp_services.dart';

extension GeneralPathExtensions on OtpPathEnum {
  String get _rawValue {
    switch (this) {
      case OtpPathEnum.checkOtp:
        return '/check-otp';
      case OtpPathEnum.checkUserNecessarySendOtp:
        return '/check-user-necessary-send-otp';
      case OtpPathEnum.resendOtp:
        return '/re-send-otp';
    }
  }

  String get path {
    return "/public$_rawValue";
  }

  String get fullPath {
    return path;
  }
}
