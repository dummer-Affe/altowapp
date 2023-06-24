import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';


part 'story_response_model.g.dart';


@JsonSerializable()
class SuccessStoryResponse extends INetworkModel<SuccessStoryResponse> {
  String? title, organizationName, storyParagraph;
  List<String>? coverImageLinks, contentImageLinks;
  int? id;
  
  SuccessStoryResponse({
    this.id,
    this.title,
    this.organizationName,
    this.storyParagraph,
    this.contentImageLinks,
    this.coverImageLinks,

  });

  @override
  SuccessStoryResponse fromJson(Map<String, dynamic> json) {
    return _$SuccessStoryResponseFromJson(json);
  }

  @override
  factory SuccessStoryResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessStoryResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SuccessStoryResponseToJson(this);
  }
}
