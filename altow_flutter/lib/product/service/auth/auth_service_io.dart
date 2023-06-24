import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';
import '../../model/success_stories_response/stories_response_model.dart';
import '../../model/success_story_response/story_response_model.dart';

abstract class IAuthService {
  Future<
      IResponseModel<SuccessStoriesResponse?,
          INetworkModel<ProjectErrorModel>?>> getStories();
  Future<
      IResponseModel<SuccessStoryResponse?,
          INetworkModel<ProjectErrorModel>?>> getStory(String id);
}
