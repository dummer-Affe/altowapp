import '/view/home_base/model/home_base_page.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '/core/states/app_fonts/app_fonts_panel.dart';
import 'go_to_button.dart';

class ParagraphWidget extends StatelessWidget {
  final String title;
  final String paragraph;
  final String buttonText;
  final bool button;
  final String? url;
  final HomeBasePageEnum? destinationPage;
  const ParagraphWidget({
    super.key,
    this.url,
    this.destinationPage,
    required this.button,
    required this.paragraph,
    required this.title,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(title,
              textAlign: TextAlign.left, style: AppFontsPanel.titleStyle),
        ),
        const FigmaBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(paragraph,
              textAlign: TextAlign.left, style: AppFontsPanel.paragraphStyle),
        ),
        button
            ? GoToButtonWidget(
                height: 45,
                destinationPage: destinationPage,
                alignment: Alignment.centerLeft,
                buttonText: buttonText,
                padding: Figma.of(context).paddingOnly(top: 10),
              )
            : const SizedBox(),
        const FigmaBox(
          height: 10,
        )
      ],
    );
  }
}
