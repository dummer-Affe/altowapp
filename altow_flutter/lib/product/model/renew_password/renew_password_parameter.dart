import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'renew_password_parameter.g.dart';

@JsonSerializable()
class RenewPasswordParameter extends INetworkModel<RenewPasswordParameter> {
  String? mobileNumber, password;
  RenewPasswordParameter({this.mobileNumber, this.password});

  @override
  RenewPasswordParameter fromJson(Map<String, dynamic> json) {
    return _$RenewPasswordParameterFromJson(json);
  }

  factory RenewPasswordParameter.fromJson(Map<String, dynamic> json) {
    return _$RenewPasswordParameterFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RenewPasswordParameterToJson(this);
  }
}
