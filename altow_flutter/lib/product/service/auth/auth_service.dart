import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

import '/product/init/enum/auth_path_enum.dart';
import '/product/init/extensions/auth_path_extensions.dart';
import '/product/service/auth/auth_service_io.dart';
import '../../../core/states/app_user/app_user.dart';
import '../../model/error/project_error_model.dart';
import '../../model/success_stories_response/stories_response_model.dart';
import '../../model/success_story_response/story_response_model.dart';

class AuthService extends IAuthService {
  @override
  Future<IResponseModel<SuccessStoriesResponse?, ProjectErrorModel?>>
      getStories() async {
    try {
      printDetail(
          path: AuthPathEnum.successStories.fullPath,
          parameter: null,
          method: RequestType.GET,
          serviceName: "getStories");
      final dio = Dio();
      addAuthorization(dio);
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
      addAuthorization(dio);
      String path = "${AuthPathEnum.successStories.fullPath}/$id";
      printDetail(
          path: path,
          parameter: null,
          method: RequestType.GET,
          serviceName: "getStory");
      final response = await dio.get(path);
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

  void addAuthorization(Dio dio) {
    dio.options.headers["Authorization"] =
        "Bearer ${AppUser.instance.loginProviderToken}";
  }

  void printDetail(
      {required String path,
      required dynamic parameter,
      required RequestType method,
      required String serviceName}) {
    print("--------------SERVICE DETAIL--------------");
    print("SERVICE TO RUN: $serviceName");
    print("SERVICE PATH: $path");
    if (parameter != null) {
      print(
          "SERVICE PARAMETER: ${parameter is File ? parameter.path : parameter.toJson()}");
    }
    print("SERVICE METHOD: $method");
    print("------------SERVICE DETAIL END------------");
  }
}
