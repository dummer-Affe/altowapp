import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'check_otp_response.g.dart';

@JsonSerializable()
class CheckOtpResponse  extends INetworkModel<CheckOtpResponse> {
  String? message,status;
  bool? data;

  CheckOtpResponse ({this.message,this.status,this.data});

  @override
  CheckOtpResponse fromJson(Map<String, dynamic> json) {
    return _$CheckOtpResponseFromJson(json);
  }

  factory CheckOtpResponse.fromJson(Map<String, dynamic> json) {
    return _$CheckOtpResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CheckOtpResponseToJson(this);
  }
}
