// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_requirement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequirementResponse _$OtpRequirementResponseFromJson(
        Map<String, dynamic> json) =>
    OtpRequirementResponse(
      data: json['data'] as bool?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$OtpRequirementResponseToJson(
        OtpRequirementResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
