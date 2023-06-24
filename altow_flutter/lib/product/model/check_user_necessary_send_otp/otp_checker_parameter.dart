import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'otp_checker_parameter.g.dart';

@JsonSerializable()
class OtpCheckerParameter extends INetworkModel<OtpCheckerParameter> {
  String? mobilePhone, email;


  OtpCheckerParameter({this.mobilePhone, this.email});

  OtpCheckerParameter.newPassword({this.mobilePhone});

  @override
  OtpCheckerParameter fromJson(Map<String, dynamic> json) {
    return _$OtpCheckerParameterFromJson(json);
  }

  factory OtpCheckerParameter.fromJson(Map<String, dynamic> json) {
    return _$OtpCheckerParameterFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      if (mobilePhone != null) 'mobilePhone': mobilePhone,
      if (email != null) 'email': email,

    };
  }
}
