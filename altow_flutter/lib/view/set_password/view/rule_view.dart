import '/core/states/app_fonts/app_fonts_panel.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/icon_paths.dart';
import '../model/input_rule.dart';

class RuleView extends StatelessWidget {
  final InputRule rule;
  const RuleView({super.key, required this.rule});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return rule.isValid != null
        ? Row(
            children: [
              Container(
                width: figma.px(18, Axis.horizontal),
                height: figma.px(18, Axis.horizontal),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: rule.isValid == false
                        ? const Color(0xFFFF5494)
                        : const Color(0xFF1FCAA5)),
                alignment: Alignment.center,
                child: rule.isValid == false
                    ? Image.asset(
                        IconPaths.close3,
                        width: figma.px(6.5, Axis.horizontal),
                      )
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      ),
              ),
              figma.spacer(17, Axis.horizontal),
              SizedBox(
                width: context.width - context.width * 0.3,
                child: Text(
                  rule.text,
                  style: AppFontsPanel.rule,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
