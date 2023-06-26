// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserInformations _$AuthUserInformationsFromJson(
        Map<String, dynamic> json) =>
    AuthUserInformations(
      mobilePhone: json['mobilePhone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$AuthUserInformationsToJson(
        AuthUserInformations instance) =>
    <String, dynamic>{
      'mobilePhone': instance.mobilePhone,
      'email': instance.email,
    };
