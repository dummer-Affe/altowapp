// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginParameter _$UserLoginParameterFromJson(Map<String, dynamic> json) =>
    UserLoginParameter(
      mobileNumber: json['mobileNumber'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserLoginParameterToJson(UserLoginParameter instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'password': instance.password,
    };
