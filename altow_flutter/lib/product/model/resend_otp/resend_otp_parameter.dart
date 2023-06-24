import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'resend_otp_parameter.g.dart';

@JsonSerializable()
class ResendOtpParameter extends INetworkModel<ResendOtpParameter> {
  String? otpProvider, searchValue, phoneNumber;
  //bool? changePwdReq;

  ResendOtpParameter({this.otpProvider, this.searchValue});
  ResendOtpParameter.mobile({this.phoneNumber}) : otpProvider = 'MOBILE';
  ResendOtpParameter.email({this.searchValue,this.phoneNumber}) : otpProvider = 'EMAIL';
  //ResendOtpParameter.newPassword({this.searchValue}) : changePwdReq = true;

  @override
  ResendOtpParameter fromJson(Map<String, dynamic> json) {
    return _$ResendOtpParameterFromJson(json);
  }

  factory ResendOtpParameter.fromJson(Map<String, dynamic> json) {
    return _$ResendOtpParameterFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ResendOtpParameterToJson(this);
  }
}
