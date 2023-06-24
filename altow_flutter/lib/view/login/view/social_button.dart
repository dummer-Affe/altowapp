import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../../core/constants/icon_paths.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/init/enum/login_provider_type_enum.dart';
import '../../../product/widgets/sized_button/sized_button.dart';

class SocialButton extends StatelessWidget {
  final ProviderType loginProviderType;
  final Function() onPressed;

  const SocialButton(
      {super.key, required this.loginProviderType, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedButton(
      width: double.infinity,
      height: AppFontsPanel.buttonHeight,
      radius: 14,
      borderColor: const Color(0xFF6D59BD),
      borderWith: 1,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              getAssetPath(loginProviderType),
              width: AppFontsPanel.loginSocialIcon,
            ),
          ),
          Text(
              "Continue with ${loginProviderType.convertString.capitalizeFirst}",
              style: AppFontsPanel.smallStyle)
        ],
      ),
    );
  }

  String getAssetPath(ProviderType type) {
    switch (type) {
      case ProviderType.apple:
        return IconPaths.apple;
      case ProviderType.facebook:
        return IconPaths.facebook;
      case ProviderType.google:
        return IconPaths.logoGoogle;
      case ProviderType.mobile:
        return IconPaths.phone;
    }
  }
}
