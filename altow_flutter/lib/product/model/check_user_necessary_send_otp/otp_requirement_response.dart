import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'otp_requirement_response.g.dart';

@JsonSerializable()
class OtpRequirementResponse extends INetworkModel<OtpRequirementResponse> {
  String? message, status;
  bool? data;

  OtpRequirementResponse({
    this.data,
    this.message,
    this.status,
  });

  @override
  OtpRequirementResponse fromJson(Map<String, dynamic> json) {
    return _$OtpRequirementResponseFromJson(json);
  }

  factory OtpRequirementResponse.fromJson(Map<String, dynamic> json) {
    return _$OtpRequirementResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$OtpRequirementResponseToJson(this);
  }
}
