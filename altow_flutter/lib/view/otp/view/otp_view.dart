import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/widgets/otp_field.dart';
import '../../base/base_design.dart';
import '../model/otp_view_model.dart';
import 'otp_helper.dart';
import 'timer_or_resend.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  var model = OtpViewModel();
  String code = '';
  TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return BaseDesign(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        onSubmitButtonPressed: () async {
          await model.controlOtp(otpCode: code, context: context);
        },
        title: "OTP Verification",
        text: model.titleText,
        submitButtonText: "Verify",
        bottomWidget: OtpHelper(
          showHelper:
              MediaQuery.of(context).viewInsets.bottom == 0 ? false : true,
          otp: "123456",
          onPressed: (otp) {
            otpController.text = otp;
          },
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpField(
              onChanged: (code) {
                this.code = code;
              },
              controller: otpController,
              onCompleted: (code) async {
                this.code = code;
                await model.controlOtp(otpCode: code, context: context);
              },
              passwordPin: false,
            ),
            figma.spacer(23, Axis.vertical),
            TimerOrResend(model),
            figma.spacer(15, Axis.vertical),
            Observer(
              builder: (context) {
                return isError
                    ? Text(
                        model.errorText!,
                        style: AppFontsPanel.errorStyle,
                      )
                    : const SizedBox();
              },
            )
          ],
        ));
  }

  bool get isError => model.errorText != null;
}
