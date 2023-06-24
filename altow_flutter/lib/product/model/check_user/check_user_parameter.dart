import 'package:json_annotation/json_annotation.dart';

part 'check_user_parameter.g.dart';

@JsonSerializable()
class CheckUserParameter {
  String? phoneNumber;
  CheckUserParameter({this.phoneNumber});

  CheckUserParameter fromJson(Map<String, dynamic> json) {
    return _$CheckUserParameterFromJson(json);
  }

  factory CheckUserParameter.fromJson(Map<String, dynamic> json) {
    return _$CheckUserParameterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CheckUserParameterToJson(this);
  }
}
