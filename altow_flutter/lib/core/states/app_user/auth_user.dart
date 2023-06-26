import 'package:json_annotation/json_annotation.dart';

part 'auth_user.g.dart';

@JsonSerializable()
class AuthUserInformations {
  String? mobilePhone, email;
  AuthUserInformations({this.mobilePhone, this.email});

  AuthUserInformations fromJson(Map<String, dynamic> json) {
    return _$AuthUserInformationsFromJson(json);
  }

  factory AuthUserInformations.fromJson(Map<String, dynamic> json) {
    return _$AuthUserInformationsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthUserInformationsToJson(this);
  }
}
