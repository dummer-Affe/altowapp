// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessStoriesResponse _$SuccessStoriesResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessStoriesResponse(
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => SuccessStoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuccessStoriesResponseToJson(
        SuccessStoriesResponse instance) =>
    <String, dynamic>{
      'stories': instance.stories,
    };
