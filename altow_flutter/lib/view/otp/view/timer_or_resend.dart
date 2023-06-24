import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../model/otp_view_model.dart';

class TimerOrResend extends StatelessWidget {
  final OtpViewModel model;
  const TimerOrResend(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => model.time > 0
          ? Text(
              timeToText(model.time),
              style: AppFontsPanel.resendTimerStyle,
            )
          : TextButton(
              onPressed: () {
                model.resendOtp(context);
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Resend again",
                style: AppFontsPanel.resendStyle,
              )),
    );
  }

  String timeToText(int time) {
    int min = time ~/ 60;
    int second = time - (min * 60);
    return "($min:${addZero(second)})";
  }

  String addZero(int time) {
    if (time < 10) {
      return "0$time";
    } else {
      return time.toString();
    }
  }
}
