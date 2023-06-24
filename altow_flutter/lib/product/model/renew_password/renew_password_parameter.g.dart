// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_password_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewPasswordParameter _$RenewPasswordParameterFromJson(
        Map<String, dynamic> json) =>
    RenewPasswordParameter(
      mobileNumber: json['mobileNumber'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RenewPasswordParameterToJson(
        RenewPasswordParameter instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'password': instance.password,
    };
