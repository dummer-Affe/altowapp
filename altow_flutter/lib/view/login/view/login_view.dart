import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/core/states/app_colors/app_colors.dart';
import '/core/states/app_settings/app_settings.dart';
import '/view/login/model/login_view_model.dart';
import '../../../core/constants/icon_paths.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/init/enum/login_provider_type_enum.dart';
import '../../../product/widgets/context_updater.dart';
import '../../../product/widgets/sized_button/sized_button.dart';
import 'social_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  var model = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return ContextUpdater(
      child: GetBuilder<AppSettings>(builder: (controller) {
        var figma = Figma.of(context);
        return Scaffold(
          backgroundColor: const Color(0xFF1B1C24),
          body: Column(children: [
            figma.spacer(145, Axis.vertical),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconPaths.altowIcon,
                  height: AppFontsPanel.loginTamIcon,
                  fit: BoxFit.fitHeight,
                ),
                figma.spacer(14, Axis.horizontal),
                const SizedBox(
                  width: 14,
                ),
                Text("Altow Projects", style: AppFontsPanel.loginTitleStyle),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppFontsPanel.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  figma.spacer(169, Axis.vertical),
                  Text("Continue With", style: AppFontsPanel.titleStyle),
                  figma.spacer(29, Axis.vertical),
                  SizedButton(
                    width: double.infinity,
                    height: AppFontsPanel.buttonHeight,
                    radius: 14,
                    linearGradient: LinearGradient(
                        colors: AppColors.button,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderWith: 1,
                    onPressed: () {
                      model.login(
                          loginProviderType: ProviderType.mobile,
                          context: context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconPaths.phone,
                          height: AppFontsPanel.loginPhoneIcon,
                        ),
                        figma.spacer(9.35, Axis.horizontal),
                        Text("Mobile Number", style: AppFontsPanel.buttonStyle)
                      ],
                    ),
                  ),
                  figma.spacer(38, Axis.vertical),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: figma.px(37, Axis.horizontal)),
                        child: Text("or Sign up with",
                            style: AppFontsPanel.smallStyle),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  figma.spacer(29, Axis.vertical),
                  for (var loginProviderType in model.socials)
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: figma.px(7, Axis.vertical)),
                      child: SocialButton(
                          loginProviderType: loginProviderType,
                          onPressed: () {
                            model.login(
                                loginProviderType: loginProviderType,
                                context: context);
                          }),
                    )
                ],
              ),
            ),
          ]),
        );
      }),
    );
  }
}
