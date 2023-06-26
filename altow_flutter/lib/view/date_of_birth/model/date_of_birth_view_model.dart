// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/init/navigation/navigation_enums.dart';
import '../../tracker/user_login_or_register_tracker.dart';

part 'date_of_birth_view_model.g.dart';

class DateOfBirthViewModel = _DateOfBirthViewModelBase
    with _$DateOfBirthViewModel;

abstract class _DateOfBirthViewModelBase with Store {
  final RegistrationTracker _tracker = RegistrationTracker.instance;

  PageController pageController = PageController();

  FocusNode yearFocus = FocusNode();
  @observable
  int focusedPartIndex = 0;

  @observable
  int? day;
  @observable
  int? month;
  @observable
  int? year;

  bool get showSubmitBtn => day != null && month != null && year != null;

  bool get showPageView => focusedPartIndex < 2;

  @action
  void focusPart(int index, BuildContext context) {
    if (index != 2) {
      if (focusedPartIndex == 2) {
        pageController = PageController(initialPage: index);
      } else {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      }
      if (yearFocus.hasFocus) {
       
        yearFocus.unfocus();
      }
    } else {
      if (!yearFocus.hasFocus) {
        yearFocus.requestFocus();
      }
    }
    focusedPartIndex = index;
  }

  @action
  void selectDay(int day) {
    this.day = day;
    focusedPartIndex = 1;
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @action
  void setYear(int year) {
    this.year = year;
  }

  @action
  void selectMonth(int month) {
    this.month = month;
    focusedPartIndex = 2;
    if (!yearFocus.hasFocus) {
      yearFocus.requestFocus();
    }
  }

  @action
  Future<void> setBirthdate(BuildContext context) async {
    if (day == null || month == null || year == null) return;
    DateTime date = DateTime(year!, month!, day!);
    _tracker.setDate(context: context, dateTime: date);
  }

  Future<bool> onWillPop(BuildContext context) async {
    return RegistrationTracker.instance
        .onWillPop(page: NavigationEnums.dateOfBirth, context: context);
  }
}
