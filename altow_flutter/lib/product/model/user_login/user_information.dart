import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_information.g.dart';

@JsonSerializable()
class UserInformation extends INetworkModel<UserInformation> {
  String? name, surname, email;

  UserInformation({this.name, this.surname, this.email});

  @override
  UserInformation fromJson(Map<String, dynamic> json) {
    return _$UserInformationFromJson(json);
  }

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return _$UserInformationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserInformationToJson(this);
  }
}
