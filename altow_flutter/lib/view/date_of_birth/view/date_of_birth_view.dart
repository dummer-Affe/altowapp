import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/constants/icon_paths.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/utility/date_time_util.dart';
import '../../../product/widgets/sized_button/sized_button.dart';
import '../../base/base_design.dart';
import '../model/date_of_birth_view_model.dart';
import 'date_part_view.dart';
import 'day_picker_view.dart';
import 'month_picker_view.dart';
import 'year_part_view.dart';

class DateOfBirthView extends StatefulWidget {
  const DateOfBirthView({super.key});

  @override
  State<DateOfBirthView> createState() => _DateOfBirthViewState();
}

class _DateOfBirthViewState extends State<DateOfBirthView> {
  var model = DateOfBirthViewModel();

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Stack(
      children: [
        BaseDesign(
            title: "Date of birth",
            text: "Enter your date of birth",
            noSubmitBtn: true,
            noBackBtn: true,
            bottomPadding: 0,
            onWillPop: () {
              return model.onWillPop(context);
            },
            child: Column(
              children: [
                figma.spacer(34, Axis.vertical),
                FigmaContainer(
                  height: 56,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.secondary, width: 1.5),
                      borderRadius: BorderRadius.circular(14)),
                  child: Row(children: [
                    figma.spacer(19, Axis.horizontal),
                    Image.asset(
                      IconPaths.dateTime,
                      width: figma.px(19, Axis.horizontal),
                    ),
                    Observer(builder: (context) {
                      return Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DatePartView(
                            width: 67,
                            actualWidth: 50,
                            text: model.day?.toString(),
                            hintText: "Day",
                            isSelected: model.focusedPartIndex == 0,
                            onPressed: () {
                              model.focusPart(0, context);
                            },
                          ),
                          Text(
                            "/",
                            style: figma.style(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.text),
                          ),
                          DatePartView(
                            width: 80,
                            actualWidth: 67,
                            text: model.month != null
                                ? DateTimeUtil.getShortName(model.month!)
                                : null,
                            hintText: "Month",
                            isSelected: model.focusedPartIndex == 1,
                            onPressed: () {
                              model.focusPart(1, context);
                            },
                          ),
                          Text(
                            "/",
                            style: figma.style(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.text),
                          ),
                          YearPartView(
                            hintText: "Year",
                            focusNode: model.yearFocus,
                            isSelected: model.focusedPartIndex == 2,
                            onPressed: () {
                              model.focusPart(2, context);
                            },
                            onChanged: (year) {
                              if (year != "" && year.length == 4) {
                                model.setYear(int.parse(year));
                              } else {
                                model.year = null;
                              }
                            },
                          ),
                          const Spacer()
                        ],
                      ));
                    }),
                  ]),
                ),
                const Spacer(),
                Observer(
                  builder: (contextm) {
                    double keyboardH = MediaQuery.of(context).viewInsets.bottom;
                    return model.focusedPartIndex == 2 && model.showSubmitBtn
                        ? Column(
                            children: [
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
                                  model.setBirthdate(context);
                                },
                                child: Text("Continue",
                                    style: AppFontsPanel.buttonStyle),
                              ),
                              figma.spacer(
                                  keyboardH == 0 ? 300 : 21, Axis.vertical)
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Observer(builder: (context) {
            return model.showPageView
                ? FigmaBox(
                    width: double.infinity,
                    height: 370,
                    child: PageView(
                      controller: model.pageController,
                      children: [
                        DayPickerView(
                          selectedIndex: model.day,
                          onResult: (value) async {
                            model.selectDay(value);
                          },
                        ),
                        MonthPickerView(
                          selectedIndex: model.month,
                          onResult: (value) async {
                            model.selectMonth(value);
                          },
                        )
                      ],
                    ),
                  )
                : const SizedBox();
          }),
        )
      ],
    );
  }
}
