// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpParameter _$ResendOtpParameterFromJson(Map<String, dynamic> json) =>
    ResendOtpParameter(
      otpProvider: json['otpProvider'] as String?,
      searchValue: json['searchValue'] as String?,
    )..phoneNumber = json['phoneNumber'] as String?;

Map<String, dynamic> _$ResendOtpParameterToJson(ResendOtpParameter instance) =>
    <String, dynamic>{
      'otpProvider': instance.otpProvider,
      'searchValue': instance.searchValue,
      'phoneNumber': instance.phoneNumber,
    };
