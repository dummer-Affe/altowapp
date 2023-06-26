import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

import '/product/init/extensions/otp_path_enum.dart';
import '/product/model/check_otp/check_otp_parameter.dart';
import '/product/model/check_otp/check_otp_response.dart';
import '/product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '/product/model/check_user_necessary_send_otp/otp_requirement_response.dart';
import '/product/model/resend_otp/resend_otp_parameter.dart';
import '/product/model/resend_otp/resend_otp_response.dart';
import '../../init/enum/otp_services.dart';
import '../../model/error/project_error_model.dart';
import 'otp_service_io.dart';

class OTPService extends IOTPService {
  @override
  Future<IResponseModel<OtpRequirementResponse?, ProjectErrorModel?>>
      checkUserNecessarySendOtp(OtpCheckerParameter parameter) async {
    try {
      printDetail(
          path: OtpPathEnum.checkUserNecessarySendOtp.fullPath,
          parameter: parameter,
          method: RequestType.POST,
          serviceName: "checkUserNecessarySendOtp");
      final dio = Dio();

      final response = await dio.post(
          OtpPathEnum.checkUserNecessarySendOtp.fullPath,
          data: parameter.toJson());
      return ResponseModel<OtpRequirementResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? OtpRequirementResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<OtpRequirementResponse?, ProjectErrorModel?>(
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
        return ResponseModel<OtpRequirementResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<CheckOtpResponse?, ProjectErrorModel?>> checkOtp(
      CheckOtpParameter parameter) async {
    try {
      printDetail(
          path: OtpPathEnum.checkOtp.fullPath,
          parameter: parameter,
          method: RequestType.POST,
          serviceName: "checkOtp");
      final dio = Dio();
      final response = await dio.post(OtpPathEnum.checkOtp.fullPath,
          data: parameter.toJson());

      return ResponseModel<CheckOtpResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? CheckOtpResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<CheckOtpResponse?, ProjectErrorModel?>(
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
        return ResponseModel<CheckOtpResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<ResendOtpResponse?, ProjectErrorModel?>> resendOtp(
      ResendOtpParameter parameter) async {
    try {
      printDetail(
          path: OtpPathEnum.resendOtp.fullPath,
          parameter: parameter,
          method: RequestType.POST,
          serviceName: "resendOtp");
      final dio = Dio();
      final response = await dio.post(OtpPathEnum.resendOtp.fullPath,
          data: parameter.toJson());
      return ResponseModel<ResendOtpResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? ResendOtpResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<ResendOtpResponse?, ProjectErrorModel?>(
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
        return ResponseModel<ResendOtpResponse?, ProjectErrorModel?>(
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
