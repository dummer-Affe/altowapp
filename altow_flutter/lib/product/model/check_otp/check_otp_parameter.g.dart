// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_otp_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOtpParameter _$CheckOtpParameterFromJson(Map<String, dynamic> json) =>
    CheckOtpParameter(
      otpProvider: json['otpProvider'] as String?,
      otpCode: json['otpCode'] as String?,
      searchValue: json['searchValue'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$CheckOtpParameterToJson(CheckOtpParameter instance) =>
    <String, dynamic>{
      'otpProvider': instance.otpProvider,
      'otpCode': instance.otpCode,
      'searchValue': instance.searchValue,
      'phoneNumber': instance.phoneNumber,
    };
