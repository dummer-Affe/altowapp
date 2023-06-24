import '/core/states/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../core/constants/icon_paths.dart';
import '../../core/states/app_fonts/app_fonts_panel.dart';

class OtpField extends StatefulWidget {
  final void Function(String code) onChanged;
  final void Function(String code) onCompleted;
  final bool passwordPin;
  final bool errorTheme;
  final EdgeInsetsGeometry? padding;
  final TextEditingController controller;
  const OtpField(
      {Key? key,
      required this.onChanged,
      required this.onCompleted,
      required this.passwordPin,
      this.padding,
      required this.controller,
      this.errorTheme = false})
      : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final focusNode = FocusNode();
  bool obscureText = true;
  int loadedCount = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Future.delayed(const Duration(milliseconds: 500))
            .then((value) => focusNode.requestFocus()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double pinSize =
        widget.passwordPin ? AppFontsPanel.pinSize : context.width * (0.123);
    if (widget.controller.text.length == 6 &&
        !focusNode.hasFocus &&
        widget.errorTheme) {
      focusNode.requestFocus();
    }
    final defaultPinTheme = PinTheme(
      width: pinSize,
      height: pinSize,
      textStyle: AppFontsPanel.otpStyle,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: AppColors.secondary),
      ),
    );
    final errorPinTheme = PinTheme(
      width: pinSize,
      height: pinSize,
      textStyle: AppFontsPanel.otpStyle,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: AppColors.error),
      ),
    );
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            length: 6,
            pinAnimationType: PinAnimationType.fade,
            controller: widget.controller,
            autofocus: true,
            onCompleted: (value) {
              widget.onCompleted(value);
            },
            onChanged: (value) {
              widget.onChanged(value);
            },
            obscuringWidget: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "*",
                style: AppFontsPanel.obsurceStyle,
              ),
            ),
            forceErrorState: widget.errorTheme,
            errorPinTheme: errorPinTheme,
            keyboardType: TextInputType.number,
            focusNode: focusNode,
            defaultPinTheme: defaultPinTheme,
            obscureText: widget.passwordPin ? obscureText : false,
            showCursor: false,
          ),
          if (widget.passwordPin) const Spacer(),
          if (widget.passwordPin)
            SizedBox(
              width: AppFontsPanel.pinSize,
              height: AppFontsPanel.pinSize,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      obscureText ? IconPaths.hide : IconPaths.visibility,
                      width: AppFontsPanel.hideIcon,
                    ),
                  )),
            )
        ],
      ),
    );
  }
}
