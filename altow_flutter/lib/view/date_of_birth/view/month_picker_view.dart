import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../core/states/app_colors/app_colors.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/functions/my_functions.dart';
import '../../../product/utility/date_time_util.dart';

class MonthPickerView extends StatelessWidget {
  final int? selectedIndex;
  final void Function(int value) onResult;
  final Color backgroundColor;
  MonthPickerView(
      {super.key,
      this.selectedIndex,
      required this.onResult,
      Color? backgroundColor})
      : backgroundColor = AppColors.background;

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Material(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: AppFontsPanel.horizontalPadding),
              child: Text(
                "Choose Month",
                style: figma.style(color: AppColors.text, fontSize: 18),
              ),
            ),
            figma.spacer(23, Axis.vertical),
            FigmaContainer(
              width: double.infinity,
              height: 316,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  color: AppColors.dateTimePickerBg),
              padding: figma.paddingSymmetric(vertical: 26, horizontal: 12),
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
                children: [
                  for (int i = 0; i < DateTimeUtil.months.length; i++)
                    TextButton(
                        onPressed: () {
                          onResult(i);
                        },
                        style: zeroPaddingTextButton(),
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedIndex == i
                                  ? null
                                  : AppColors.dateTimePickerItemBg,
                              gradient: selectedIndex == i
                                  ? LinearGradient(colors: AppColors.button)
                                  : null,
                              borderRadius: BorderRadius.circular(7)),
                          alignment: Alignment.center,
                          child: Text(
                            DateTimeUtil.months[i],
                            style: figma.style(
                                fontSize: 16,
                                color: selectedIndex == i
                                    ? AppColors.text
                                    : AppColors.bottomSheetTitle),
                          ),
                        ))
                ],
              ),
            ),
          ],
        ));
  }
}
