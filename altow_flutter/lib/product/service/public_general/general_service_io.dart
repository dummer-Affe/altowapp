import 'package:vexana/vexana.dart';

import '../../model/check_user/check_user_parameter.dart';
import '../../model/check_user/check_user_response.dart';
import '../../model/error/project_error_model.dart';
import '../../model/login/login_parameter.dart';
import '../../model/login/login_response.dart';
import '../../model/register/register_parameter.dart';
import '../../model/register/register_response.dart';
import '../../model/renew_password/renew_password_parameter.dart';
import '../../model/renew_password/renew_password_response.dart';

abstract class IGeneralService {
  Future<IResponseModel<RenewPasswordResponse?, ProjectErrorModel?>>
      renewPassword(RenewPasswordParameter parameter);
  Future<IResponseModel<RegisterResponse?, ProjectErrorModel?>> register(
      RegisterParameter parameter);
  Future<IResponseModel<LoginResponse?, ProjectErrorModel?>> login(
      LoginParameter parameter);
  Future<IResponseModel<CheckUserResponse?, ProjectErrorModel?>> checkUser(
      CheckUserParameter parameter);
}
