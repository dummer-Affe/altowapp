// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpResponse _$ResendOtpResponseFromJson(Map<String, dynamic> json) =>
    ResendOtpResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$ResendOtpResponseToJson(ResendOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
