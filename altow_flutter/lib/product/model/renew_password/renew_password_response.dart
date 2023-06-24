import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'renew_password_response.g.dart';

@JsonSerializable()
class RenewPasswordResponse extends INetworkModel<RenewPasswordResponse> {
  String? message, status, data;

  RenewPasswordResponse({this.message, this.status, this.data});

  @override
  RenewPasswordResponse fromJson(Map<String, dynamic> json) {
    return _$RenewPasswordResponseFromJson(json);
  }

  factory RenewPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$RenewPasswordResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RenewPasswordResponseToJson(this);
  }
}
