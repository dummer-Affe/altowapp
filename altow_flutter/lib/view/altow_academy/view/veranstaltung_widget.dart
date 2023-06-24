import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/widgets/go_to_button.dart';
import '../model/veranstaltungen.dart';

class VeranstaltungWidget extends StatelessWidget {
  final Veranstaltung veranstaltung;

  const VeranstaltungWidget({
    super.key,
    required this.veranstaltung,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FigmaBox(
          width: double.infinity,
          child: Text(veranstaltung.dateOf,
              textAlign: TextAlign.left, style: AppFontsPanel.titleStyle),
        ),
        const FigmaBox(
          height: 10,
        ),
        FigmaBox(
          width: double.infinity,
          child: Text(veranstaltung.category,
              textAlign: TextAlign.left,
              style: AppFontsPanel.verantulgenCategoryStyle),
        ),
        const FigmaBox(
          height: 10,
        ),
        FigmaBox(
          width: double.infinity,
          child: Text(veranstaltung.title,
              textAlign: TextAlign.left, style: AppFontsPanel.titleStyle),
        ),
        const FigmaBox(
          height: 10,
        ),
        FigmaBox(
          width: double.infinity,
          child: Text(veranstaltung.paragraph,
              textAlign: TextAlign.left, style: AppFontsPanel.paragraphStyle),
        ),
        GoToButtonWidget(
          url: veranstaltung.url,
          height: 45,
          alignment: Alignment.centerLeft,
          buttonText: veranstaltung.buttonName,
          padding: Figma.of(context).paddingOnly(top: 10),
        ),
        Divider(
          color: AppColors.hintText,
        )
      ],
    );
  }
}
