import '/core/init/navigation/navigation_enums.dart';
import '/core/init/navigation/navigation_service.dart';
import '/core/states/app_fonts/app_fonts_panel.dart';
import '/view/home_base/model/home_base_page_controller.dart';
import 'package:flutter/material.dart';

import '../../view/home_base/model/home_base_page.dart';

class GoToButtonWidget extends StatelessWidget {
  final String buttonText;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;
  final double? width, height;
  final String? url;
  final HomeBasePageEnum? destinationPage;
  const GoToButtonWidget(
      {super.key,
      required this.buttonText,
      required this.alignment,
      this.height,
      this.width,
      this.destinationPage,
      this.url,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Align(
        alignment: alignment,
        child: SizedBox(
          height: height,
          width: width,
          child: TextButton(
            onPressed: () {
              if (url != null) {
                NavigationService.push(NavigationEnums.webviewPage, data: url);
              } else if (destinationPage != null) {
                HomeBasePageController.instance.navigatePage(destinationPage!);
              } else {}
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              buttonText,
              style: AppFontsPanel.smallStyle,
            ),
          ),
        ),
      ),
    );
  }
}
