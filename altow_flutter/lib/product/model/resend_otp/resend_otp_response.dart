import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'resend_otp_response.g.dart';

@JsonSerializable()
class ResendOtpResponse  extends INetworkModel<ResendOtpResponse> {
  String? message,status;
  bool? data;

  ResendOtpResponse ({this.message,this.status,this.data});

  @override
  ResendOtpResponse fromJson(Map<String, dynamic> json) {
    return _$ResendOtpResponseFromJson(json);
  }

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    return _$ResendOtpResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ResendOtpResponseToJson(this);
  }
}
