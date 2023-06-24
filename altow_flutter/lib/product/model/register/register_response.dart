import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends INetworkModel<RegisterResponse> {
  String? message, status, data;

  RegisterResponse({this.message, this.status, this.data});

  @override
  RegisterResponse fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterResponseToJson(this);
  }
}
