import 'package:json_annotation/json_annotation.dart';

part 'register_parameter.g.dart';

@JsonSerializable()
class RegisterParameter {
  String? mobilePhone, email, password, birthdate, username, roleList;
  RegisterParameter(
      {this.mobilePhone,
      this.password,
      this.email,
      this.birthdate,
      this.roleList = "ROLE_USER",
      this.username});

  RegisterParameter fromJson(Map<String, dynamic> json) {
    return _$RegisterParameterFromJson(json);
  }

  factory RegisterParameter.fromJson(Map<String, dynamic> json) {
    return _$RegisterParameterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterParameterToJson(this);
  }
}
