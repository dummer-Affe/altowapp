// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessStoryResponse _$SuccessStoryResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessStoryResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      organizationName: json['organizationName'] as String?,
      storyParagraph: json['storyParagraph'] as String?,
      contentImageLinks: (json['contentImageLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      coverImageLinks: (json['coverImageLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SuccessStoryResponseToJson(
        SuccessStoryResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'organizationName': instance.organizationName,
      'storyParagraph': instance.storyParagraph,
      'coverImageLinks': instance.coverImageLinks,
      'contentImageLinks': instance.contentImageLinks,
      'id': instance.id,
    };
