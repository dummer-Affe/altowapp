import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_login_response.g.dart';

@JsonSerializable()
class UserLoginResponse extends INetworkModel<UserLoginResponse> {
  String? message, status, data;

  UserLoginResponse({this.message, this.status, this.data});

  @override
  UserLoginResponse fromJson(Map<String, dynamic> json) {
    return _$UserLoginResponseFromJson(json);
  }

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return _$UserLoginResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserLoginResponseToJson(this);
  }
}
