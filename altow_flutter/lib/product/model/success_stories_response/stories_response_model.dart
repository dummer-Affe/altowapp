import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';


import '../success_story_response/story_response_model.dart';

part 'stories_response_model.g.dart';

@JsonSerializable()
class SuccessStoriesResponse extends INetworkModel<SuccessStoriesResponse> {
  List<SuccessStoryResponse>? stories;
  SuccessStoriesResponse({this.stories});

  @override
  SuccessStoriesResponse fromJson(Map<String, dynamic> json) {
    return _$SuccessStoriesResponseFromJson(json);
  }

  SuccessStoriesResponse fromList(List<Map<String, dynamic>> list) {
    return SuccessStoriesResponse(
        stories: list.map((e) => SuccessStoryResponse.fromJson(e)).toList());
  }

  factory SuccessStoriesResponse.fromJson(List<Map<String, dynamic>> list) {
    return SuccessStoriesResponse(
        stories: list.map((e) => SuccessStoryResponse.fromJson(e)).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SuccessStoriesResponseToJson(this);
  }
}
