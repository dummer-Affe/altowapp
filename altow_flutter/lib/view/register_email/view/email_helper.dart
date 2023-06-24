import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';

class EmailHelper extends StatelessWidget {
  final List<String> emails;
  final Function(String email) onPressed;
  final bool showHelper;
  const EmailHelper(
      {super.key,
      required this.emails,
      required this.onPressed,
      this.showHelper = true});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: const Color(0xFF313132),
      height: !showHelper ? 0 : AppFontsPanel.emailHelperHeight,
      width: double.infinity,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        for (var email in emails)
          TextButton(
              onPressed: () {
                onPressed(email);
              },
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                children: [
                  Container(
                    width: context.width / 3,
                    alignment: Alignment.center,
                    child: Text(
                      "“$email“",
                      style: AppFontsPanel.emailHelperStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: figma.px(15, Axis.vertical),
                        bottom: figma.px(9, Axis.vertical)),
                    child: Container(
                        width: 1,
                        color: const Color(0xFF636366).withOpacity(0.5)),
                  ),
                ],
              ))
      ]),
    );
  }
}
