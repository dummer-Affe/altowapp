import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../product/widgets/sized_button/sized_button.dart';

class DatePartView extends StatelessWidget {
  final String hintText;
  final String? text;
  final bool isSelected;
  final dynamic Function() onPressed;
  final double width, actualWidth;
  const DatePartView(
      {super.key,
      this.text,
      required this.width,
      required this.actualWidth,
      required this.hintText,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
      child: FigmaContainer(
        width: width,
        height: double.infinity,
        alignment: Alignment.center,
        child: SizedButton(
          onPressed: onPressed,
          radius: 7,
          linearGradient:
              isSelected ? LinearGradient(colors: AppColors.button) : null,
          width: figma.px(actualWidth, Axis.horizontal),
          height: double.infinity,
          alignment: Alignment.center,
          child: Text(
            text ?? (!isSelected ? hintText : "---"),
            style: isSelected
                ? figma.style(
                    fontSize: 24,
                    color: AppColors.text,
                    fontWeight: FontWeight.w700)
                : figma.style(
                    fontSize: 16,
                    color: AppColors.text,
                    fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
