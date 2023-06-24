import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/functions/my_functions.dart';

class DayPickerView extends StatelessWidget {
  final int? selectedIndex;
  final void Function(int value) onResult;
  final Color backgroundColor;
  DayPickerView(
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
              "Choose day",
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
            child: Padding(
              padding: figma.paddingSymmetric(vertical: 26, horizontal: 12),
              child: Column(children: [
                for (int i = 0; i < 31; i += 7)
                  FigmaBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(children: [
                      for (int j = i; j < i + 7; j++) indexView(j, context)
                    ]),
                  )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget indexView(int index, BuildContext context) {
    var figma = Figma.of(context);
    return index < 31
        ? Expanded(
            child: TextButton(
                style: zeroPaddingTextButton(),
                onPressed: () {
                  onResult(index + 1);
                },
                child: Padding(
                  padding: selectedIndex == index + 1
                      ? figma.paddingAll(8)
                      : EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: selectedIndex == index + 1
                            ? LinearGradient(colors: AppColors.button)
                            : null,
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            days[index],
                            style: figma.style(
                                color: selectedIndex == index + 1
                                    ? AppColors.text
                                    : AppColors.bottomSheetTitle),
                          )
                        ]),
                  ),
                )),
          )
        : const Spacer();
  }

  bool isClickable(int index) {
    return index > 1 && index < 33;
  }

  final List<String> days = const [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];
}
