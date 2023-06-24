import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/widgets/otp_field.dart';
import '../../base/base_design.dart';
import '../model/set_password_view_model.dart';
import 'rule_view.dart';

class SetPasswordView extends StatefulWidget {
  const SetPasswordView({super.key});

  @override
  State<SetPasswordView> createState() => _SetPasswordViewState();
}

class _SetPasswordViewState extends State<SetPasswordView> {
  SetPasswordViewModel model = SetPasswordViewModel();
  TextEditingController controller = TextEditingController();
  String password = "";
  @override
  void initState() {
    password = controller.text;
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return BaseDesign(
        onSubmitButtonPressed: () {
          model.createPin(context);
        },
        onBackButtonPressed: () {
          model.onWillPop(context);
        },
        onWillPop: () async {
          return model.onWillPop(context);
        },
        noBackBtn: model.firstTime ? true : false,
        padding: EdgeInsets.zero,
        staticAreaPadding:
            figma.paddingSymmetric(horizontal: AppFontsPanel.horizontalPadding),
        title: 'Set Password',
        text: model.titleText,
        submitButtonText: "Create Pin",
        child: Column(
          children: [
            Observer(
              builder: (context) {
                return OtpField(
                  errorTheme: model.errorPin,
                  passwordPin: true,
                  onCompleted: (code) {
                    model.createPin(context);
                  },
                  controller: controller,
                  padding: figma.paddingOnly(
                      left: AppFontsPanel.horizontalPadding, right: 12),
                  onChanged: (code) {
                    if (code.length < password.length) {
                      controller.clear();
                    }
                    password = controller.text;
                    model.pinChanged(controller.text);
                  },
                );
              },
            ),
            //appFonts.spacerFromFigma(49, Axis.vertical),
            figma.spacer(25, Axis.vertical),
            if (model.firstTime)
              Observer(
                builder: (context) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppFontsPanel.horizontalPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (model.rule1!.isValid == false)
                            Padding(
                              padding: figma.paddingOnly(bottom: 11),
                              child: RuleView(rule: model.rule1!),
                            ),
                          if (model.rule2!.isValid == false)
                            Padding(
                              padding: figma.paddingOnly(bottom: 11),
                              child: RuleView(rule: model.rule2!),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ));
  }
}
