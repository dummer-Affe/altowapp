import '/product/model/check_otp/check_otp_parameter.dart';
import '/product/model/check_otp/check_otp_response.dart';
import '/product/model/check_user_necessary_send_otp/otp_checker_parameter.dart';
import '/product/model/check_user_necessary_send_otp/otp_requirement_response.dart';
import '/product/model/resend_otp/resend_otp_parameter.dart';
import '/product/model/resend_otp/resend_otp_response.dart';
import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';

abstract class IOTPService {
  Future<IResponseModel<OtpRequirementResponse?, ProjectErrorModel?>>
      checkUserNecessarySendOtp(OtpCheckerParameter parameter);
  Future<IResponseModel<CheckOtpResponse?, ProjectErrorModel?>> checkOtp(
      CheckOtpParameter parameter);
  Future<IResponseModel<ResendOtpResponse?, ProjectErrorModel?>> resendOtp(
      ResendOtpParameter parameter);
}
