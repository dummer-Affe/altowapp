// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckUserResponse _$CheckUserResponseFromJson(Map<String, dynamic> json) =>
    CheckUserResponse(
      message: json['message'] as String?,
      data: json['data'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CheckUserResponseToJson(CheckUserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
