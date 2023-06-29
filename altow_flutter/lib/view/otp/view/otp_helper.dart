import 'package:altow_projects/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';

class OtpHelper extends StatelessWidget {
  final String otp;
  final Function(String email) onPressed;
  final bool showHelper;
  const OtpHelper(
      {super.key,
      required this.otp,
      required this.onPressed,
      this.showHelper = true});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: AppColors.background,
      height: !showHelper ? 0 : figma.px(46, Axis.vertical),
      width: double.infinity,
      child: TextButton(
          onPressed: () {
            onPressed(otp);
          },
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            children: [
              Padding(
                padding: figma.paddingOnly(top: 15, bottom: 9, left: 30),
                child: Container(
                    width: 1, color: const Color(0xFF636366).withOpacity(0.5)),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "From Messages",
                      style: AppFontsPanel.otpHelperTitle,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      otp,
                      style: AppFontsPanel.otpHelperOtp,
                    )
                  ],
                ),
              ),
              Padding(
                padding: figma.paddingOnly(top: 15, bottom: 9, left: 30),
                child: Container(
                    width: 1, color: const Color(0xFF636366).withOpacity(0.5)),
              ),
            ],
          )),
    );
  }
}
