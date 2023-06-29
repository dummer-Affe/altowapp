import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'check_otp_parameter.g.dart';
 
@JsonSerializable()
class CheckOtpParameter extends INetworkModel<CheckOtpParameter> {
  String? otpProvider, otpCode, searchValue, phoneNumber;

  CheckOtpParameter({this.otpProvider, this.otpCode, this.searchValue, this.phoneNumber});

  CheckOtpParameter.email({this.otpCode, String? email, this.phoneNumber})
      : otpProvider = 'EMAIL',
        searchValue = email;
  CheckOtpParameter.mobile({this.otpCode, this.phoneNumber})
      : otpProvider = 'MOBILE';

  @override
  CheckOtpParameter fromJson(Map<String, dynamic> json) {
    return _$CheckOtpParameterFromJson(json);
  }

  factory CheckOtpParameter.fromJson(Map<String, dynamic> json) {
    return _$CheckOtpParameterFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CheckOtpParameterToJson(this);
  }
}
