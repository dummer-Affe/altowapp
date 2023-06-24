import 'package:flutter/material.dart';

import '../app_settings/app_settings.dart';

class AppColors {
  static Color get background => AppSettings.instance.appearance.background;
  static Color get secondary => AppSettings.instance.appearance.secondary;
  static List<Color> get button => AppSettings.instance.appearance.button;
  static Color get topLeftCornerCircle =>
      AppSettings.instance.appearance.topLeftCornerCircle;
  static Color get text => AppSettings.instance.appearance.text;
  static Color get icon => AppSettings.instance.appearance.icon;
  static Color get hintText => AppSettings.instance.appearance.hintText;
  static Color get searchBar => AppSettings.instance.appearance.searchBar;
  static Color get searchHint => AppSettings.instance.appearance.searchHint;
  static Color get searchText => AppSettings.instance.appearance.searchText;
  static Color get jobsButton => AppSettings.instance.appearance.jobsButton;
  static Color get itemBackground =>
      AppSettings.instance.appearance.itemBackground;
  static Color get bottomSheetHintText =>
      AppSettings.instance.appearance.bottomSheetHintText;
  static Color get bottomSheetHintText2 =>
      AppSettings.instance.appearance.bottomSheetHintText2;
  static Color get bottomSheetHintText3 =>
      AppSettings.instance.appearance.bottomSheetHintText3;
  static Color get inactiveBtnColor =>
      AppSettings.instance.appearance.inactiveBtnColor;
  static Color get error => AppSettings.instance.appearance.error;
  static Color get bottomSheetTitle =>
      AppSettings.instance.appearance.bottomSheetTitle;
  static Color get bottomSheetSearchBar =>
      AppSettings.instance.appearance.bottomSheetSearchBar;
  static Color get bottomSheetItemBg =>
      AppSettings.instance.appearance.bottomSheetItemBg;
  static Color get bottomSheetText =>
      AppSettings.instance.appearance.bottomSheetText;
  static Color get bottomSheetStick =>
      AppSettings.instance.appearance.bottomSheetStick;
  static Color get bottomErrorIconBg =>
      AppSettings.instance.appearance.bottomErrorIconBg;
  static Color get bottomErrorIcon =>
      AppSettings.instance.appearance.bottomErrorIcon;
  static Color get bottomSheetBg =>
      AppSettings.instance.appearance.bottomSheetBg;
  static Color get dateTimePickerBg =>
      AppSettings.instance.appearance.dateTimePickerBg;
  static Color get dateTimePickerItemBg =>
      AppSettings.instance.appearance.dateTimePickerItemBg;
}
