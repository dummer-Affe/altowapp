import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/widgets/otp_field.dart';
import '../../base/base_design.dart';
import '../model/login_password_view_model.dart';

class LoginPasswordView extends StatefulWidget {
  const LoginPasswordView({super.key});

  @override
  State<LoginPasswordView> createState() => _LoginPasswordViewState();
}

class _LoginPasswordViewState extends State<LoginPasswordView> {
  var model = LoginPasswordViewModel();
  var controller = TextEditingController();
  String code = '';
  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Stack(
      children: [
        BaseDesign(
            noBackBtn: true,
            onSubmitButtonPressed: () {
              model.login(password: code, context: context);
            },
            padding: EdgeInsets.zero,
            staticAreaPadding: EdgeInsets.symmetric(
                horizontal:
                    figma.px(AppFontsPanel.horizontalPadding, Axis.horizontal)),
            title: "Hello!",
            text: "Enter your password",
            submitButtonText: "Log in",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (context) {
                    return OtpField(
                      errorTheme: model.errorPin,
                      passwordPin: true,
                      controller: controller,
                      padding: EdgeInsets.only(
                          left: AppFontsPanel.horizontalPadding,
                          right: figma.px(12, Axis.horizontal)),
                      onCompleted: (value) {
                        code = value;
                        model.login(password: value, context: context);
                      },
                      onChanged: (code) {
                        if (code.length < this.code.length) {
                          controller.clear();
                          model.errorPin = false;
                        }
                        this.code = controller.text;
                      },
                    );
                  },
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppFontsPanel.horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      figma.spacer(25, Axis.vertical),
                      TextButton(
                          onPressed: () {
                            model.forgetPassword(context);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Forget Password?",
                            style: AppFontsPanel.resendStyle,
                          )),
                      figma.spacer(14, Axis.vertical),
                      Observer(
                        builder: (context) {
                          return model.errorPin
                              ? Text(
                                  "Wrong Password",
                                  style: AppFontsPanel.errorStyle,
                                )
                              : const SizedBox();
                        },
                      )
                    ],
                  ),
                ))
              ],
            )),
        Positioned(
            top: figma.px(80, Axis.vertical),
            right: figma.px(30, Axis.horizontal),
            child: TextButton(
              onPressed: () {
                model.forgetPhone(context);
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                "Forget Me",
                style: AppFontsPanel.resendStyle,
              ),
            ))
      ],
    );
  }
}
