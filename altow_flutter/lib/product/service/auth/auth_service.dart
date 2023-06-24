import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

import '/product/init/enum/auth_path_enum.dart';
import '/product/init/extensions/auth_path_extensions.dart';
import '/product/service/auth/auth_service_io.dart';
import '../../model/error/project_error_model.dart';
import '../../model/success_stories_response/stories_response_model.dart';
import '../../model/success_story_response/story_response_model.dart';

class AuthService extends IAuthService {
  @override
  Future<IResponseModel<SuccessStoriesResponse?, ProjectErrorModel?>>
      getStories() async {
    try {
      print(AuthPathEnum.successStories.fullPath);
      final dio = Dio();
      final response = await dio.get(AuthPathEnum.successStories.fullPath);

      return ResponseModel<SuccessStoriesResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? SuccessStoriesResponse.fromJson(
                  List<Map<String, dynamic>>.from(response.data))
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<SuccessStoriesResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<SuccessStoriesResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<SuccessStoryResponse?, ProjectErrorModel?>> getStory(
      String id) async {
    try {
      final dio = Dio();
      print("${AuthPathEnum.successStories.fullPath}/$id");
      final response =
          await dio.get("${AuthPathEnum.successStories.fullPath}/$id");

      return ResponseModel<SuccessStoryResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? SuccessStoryResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<SuccessStoryResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<SuccessStoryResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }
}
