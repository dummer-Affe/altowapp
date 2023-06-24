// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterParameter _$RegisterParameterFromJson(Map<String, dynamic> json) =>
    RegisterParameter(
      mobilePhone: json['mobilePhone'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      birthdate: json['birthdate'] as String?,
      roleList: json['roleList'] as String? ?? "ROLE_USER",
      username: json['username'] as String?,
    );

Map<String, dynamic> _$RegisterParameterToJson(RegisterParameter instance) =>
    <String, dynamic>{
      'mobilePhone': instance.mobilePhone,
      'email': instance.email,
      'password': instance.password,
      'birthdate': instance.birthdate,
      'username': instance.username,
      'roleList': instance.roleList,
    };
