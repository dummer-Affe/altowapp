// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewPasswordResponse _$RenewPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    RenewPasswordResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$RenewPasswordResponseToJson(
        RenewPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
