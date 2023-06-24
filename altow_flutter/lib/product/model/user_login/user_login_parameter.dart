import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_login_parameter.g.dart';

@JsonSerializable()
class UserLoginParameter extends INetworkModel<UserLoginParameter> {
  String? mobileNumber, password;
  UserLoginParameter(
      {this.mobileNumber,
      this.password});


  @override
  UserLoginParameter fromJson(Map<String, dynamic> json) {
    return _$UserLoginParameterFromJson(json);
  }

  factory UserLoginParameter.fromJson(Map<String, dynamic> json) {
    return _$UserLoginParameterFromJson(json);
  }
 
  @override
  Map<String, dynamic> toJson() {
    return _$UserLoginParameterToJson(this);
  }
}
