import '/core/states/app_fonts/app_fonts_panel.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/constants/icon_paths.dart';
import '../../../product/widgets/textfield/textfield.dart';
import '../../base/base_design.dart';
import '../model/register_email_view_model.dart';
import 'email_helper.dart';

class RegisterEmailView extends StatefulWidget {
  const RegisterEmailView({super.key});

  @override
  State<RegisterEmailView> createState() => _RegisterEmailViewState();
}

class _RegisterEmailViewState extends State<RegisterEmailView> {
  var model = RegisterEmailViewModel();
  Color errorColor = const Color(0xFFFF5494);
  Color defaultColor = const Color(0xFF6D59BD);
  var emailController = TextEditingController();
  bool noNeedHelper = false;
  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return BaseDesign(
      noBackBtn: true,
      onWillPop: () {
        return model.onWillPop(context);
      },
      onSubmitButtonPressed: () {
        model.controlEmailAddress(emailController.text, context);
      },
      title: "E-mail Verification",
      text: "Enter your e-mail address",
      submitButtonText: "Continue",
      bottomWidget: EmailHelper(
        showHelper:
            MediaQuery.of(context).viewInsets.bottom == 0 || noNeedHelper
                ? false
                : true,
        emails: model.helperEmails,
        onPressed: (mail) {
          emailController.text += mail;
          emailController.selection =
              TextSelection.collapsed(offset: emailController.text.length);
          setState(() {
            noNeedHelper = true;
          });
          if (isError) {
            model.isValidEmail(emailController.text);
          }
        },
      ),
      child: Column(children: [
        Observer(
          builder: (context) {
            return RixaTextFieldFull(
              controller: emailController,
              radius: 7,
              autoFocus: true,
              showCursor: false,
              height: AppFontsPanel.buttonHeight,
              enabledColor: getFieldColor,
              textInputType: TextInputType.visiblePassword,
              focusedColor: getFieldColor,
              innerPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                    left: figma.px(21, Axis.horizontal),
                    right: figma.px(16.69, Axis.horizontal)),
                child: Image.asset(
                  IconPaths.mail,
                  width: figma.px(21, Axis.horizontal),
                  height: figma.px(14, Axis.vertical),
                ),
              ),
              onChanged: (String text) {
                var noNeedHelper = text.contains("@");
                if (this.noNeedHelper != noNeedHelper) {
                  setState(() {
                    this.noNeedHelper = noNeedHelper;
                  });
                }
                if (isError) {
                  model.isValidEmail(text);
                }
              },
              isUnderline: false,
              borderWidth: 2,
              textStyle: AppFontsPanel.textfieldStyle,
              error: isError,
              errorText: model.errorText,
              errorStyle: AppFontsPanel.errorStyle,
            );
          },
        ),
      ]),
    );
  }

  Color get getFieldColor {
    return model.errorText == null ? defaultColor : errorColor;
  }

  bool get isError {
    return model.errorText != null;
  }
}
