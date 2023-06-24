import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'check_user_response.g.dart';

@JsonSerializable()
class CheckUserResponse extends INetworkModel<CheckUserResponse> {
  String? message, status;
  bool? data;
  CheckUserResponse({this.message,this.data,this.status});

  @override
  CheckUserResponse fromJson(Map<String, dynamic> json) {
    return _$CheckUserResponseFromJson(json);
  }

  factory CheckUserResponse.fromJson(Map<String, dynamic> json) {
    return _$CheckUserResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CheckUserResponseToJson(this);
  }
}
