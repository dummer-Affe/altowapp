import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

import '/product/init/enum/general_path_enum.dart';
import '/product/init/extensions/general_path_extensions.dart';
import '/product/model/register/register_parameter.dart';
import '/product/model/register/register_response.dart';
import '/product/model/renew_password/renew_password_parameter.dart';
import '/product/model/renew_password/renew_password_response.dart';
import '../../model/check_user/check_user_parameter.dart';
import '../../model/check_user/check_user_response.dart';
import '../../model/error/project_error_model.dart';
import '../../model/login/login_parameter.dart';
import '../../model/login/login_response.dart';
import 'general_service_io.dart';

class GeneralService extends IGeneralService {
  @override
  Future<IResponseModel<LoginResponse?, ProjectErrorModel?>> login(
      LoginParameter parameter) async {
    try {
      printDetail(
          path: GeneralPathEnum.login.fullPath,
          parameter: parameter,
          method: RequestType.GET,
          serviceName: "login");
      final dio = Dio();
      final response = await dio.get(GeneralPathEnum.login.fullPath,
          data: parameter.toJson());
      return ResponseModel<LoginResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? LoginResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<RenewPasswordResponse?, ProjectErrorModel?>>
      renewPassword(RenewPasswordParameter parameter) async {
    try {
      printDetail(
          path: GeneralPathEnum.renewPassword.fullPath,
          parameter: parameter,
          method: RequestType.PUT,
          serviceName: "renewPassword");
      final dio = Dio();
      final response = await dio.put(GeneralPathEnum.renewPassword.fullPath,
          data: parameter.toJson());
      return ResponseModel<RenewPasswordResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? RenewPasswordResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<RenewPasswordResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<RenewPasswordResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<RegisterResponse?, ProjectErrorModel?>> register(
      RegisterParameter parameter) async {
    try {
      printDetail(
          path: GeneralPathEnum.register.fullPath,
          parameter: parameter,
          method: RequestType.POST,
          serviceName: "register");
      final dio = Dio();
      final response = await dio.post(GeneralPathEnum.register.fullPath,
          data: parameter.toJson());
      return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? RegisterResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<CheckUserResponse?, ProjectErrorModel?>> checkUser(
      CheckUserParameter parameter) async {
    try {
      printDetail(
          path: GeneralPathEnum.checkUser.fullPath,
          parameter: parameter,
          method: RequestType.GET,
          serviceName: "checkUser");
      final dio = Dio();
      final response = await dio.get(GeneralPathEnum.checkUser.fullPath,
          data: parameter.toJson());

      return ResponseModel<CheckUserResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? CheckUserResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<CheckUserResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<CheckUserResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
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
