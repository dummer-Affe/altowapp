import 'package:flutter/material.dart';

class Appearance {
  final String _name;
  final Color _bottomNavigationBarItemColor;
  final Color _background;
  final Color _buttonText;
  final Color _secondary;
  final List<Color> _button;
  final Color _topLeftCornerCircle;
  final Color _text;
  final Color _icon;
  final Color _hintText;
  final Color _searchBar;
  final Color _searchHint;
  final Color _searchText;
  final Color _itemBackground;
  final Color _bottomSheetHintText;
  final Color _bottomSheetHintText2;
  final Color _bottomSheetHintText3;
  final Color _inactiveBtnColor;
  final Color _error;
  final Color _bottomSheetTitle;
  final Color _bottomSheetSearchBar;
  final Color _bottomSheetItemBg;
  final Color _bottomSheetText;
  final Color _bottomSheetStick;
  final Color _bottomErrorIconBg;
  final Color _bottomErrorIcon;
  final Color _bottomSheetBg;
  final Color _dateTimePickerBg;
  final Color _dateTimePickerItemBg;
  final Color _jobsButton;

  String get name => _name;
  Color get buttonText => _buttonText;
  Color get bottomNavigationBarItemColor => _bottomNavigationBarItemColor;
  Color get background => _background;
  Color get secondary => _secondary;
  List<Color> get button => _button;
  Color get topLeftCornerCircle => _topLeftCornerCircle;
  Color get text => _text;
  Color get icon => _icon;
  Color get hintText => _hintText;
  Color get searchBar => _searchBar;
  Color get searchHint => _searchHint;
  Color get searchText => _searchText;
  Color get itemBackground => _itemBackground;
  Color get bottomSheetHintText => _bottomSheetHintText;
  Color get bottomSheetHintText2 => _bottomSheetHintText2;
  Color get bottomSheetHintText3 => _bottomSheetHintText3;
  Color get inactiveBtnColor => _inactiveBtnColor;
  Color get error => _error;
  Color get bottomSheetTitle => _bottomSheetTitle;
  Color get bottomSheetSearchBar => _bottomSheetSearchBar;
  Color get bottomSheetItemBg => _bottomSheetItemBg;
  Color get bottomSheetText => _bottomSheetText;
  Color get bottomSheetStick => _bottomSheetStick;
  Color get bottomErrorIconBg => _bottomErrorIconBg;
  Color get bottomErrorIcon => _bottomErrorIcon;
  Color get bottomSheetBg => _bottomSheetBg;
  Color get dateTimePickerBg => _dateTimePickerBg;
  Color get dateTimePickerItemBg => _dateTimePickerItemBg;
  Color get jobsButton => _jobsButton;

  Appearance.light({
    String name = "light",
    Color background = const Color(0xFFFFFFFF),
    Color bottomNavigationBarItemColor = const Color(0xFFFFFFFF),
    Color jobsButton = const Color(0xFFFF9800),
    Color secondary = const Color(0xFF6D59BD),
    List<Color> button = const [Color(0xFF6D59BD), Color(0xFF6145D0)],
    Color topLeftCornerCircle = const Color.fromARGB(255, 227, 227, 227),
    Color text = const Color(0xFF000000),
    Color buttonText = const Color(0xFFFFFFFF),
    Color icon = const Color.fromARGB(255, 0, 0, 0),
    Color hintText = const Color(0xB1171717),
    Color searchBar = const Color(0xFFFAFAFA),
    Color searchHint = const Color(0xFFAEAEAE),
    Color searchText = const Color.fromRGBO(0, 0, 0, 0.8),
    Color itemBackground = const Color(0xFF303239),
    Color bottomSheetHintText = const Color.fromRGBO(68, 75, 81, 0.7),
    Color bottomSheetHintText2 = const Color(0xFF939393),
    Color bottomSheetHintText3 = const Color.fromRGBO(0, 0, 0, 0.4),
    Color inactiveBtnColor = const Color.fromRGBO(131, 131, 150, 0.5),
    Color error = const Color(0xFFFF5494),
    Color bottomSheetTitle = const Color(0xFFC2C3CC),
    Color bottomSheetSearchBar = const Color.fromRGBO(14, 14, 14, 0.1),
    Color bottomSheetItemBg = const Color(0xFFC4C4C4),
    Color bottomSheetText = const Color.fromARGB(176, 254, 254, 255),
    Color bottomSheetStick = const Color.fromARGB(255, 255, 255, 255),
    Color bottomErrorIconBg = const Color(0xFFCC0000),
    Color bottomErrorIcon = const Color(0xFFFAFAFA),
    Color bottomSheetBg = const Color(0xFFE1E1E1),
    Color dateTimePickerBg = const Color(0xFF1E1E1E),
    Color dateTimePickerItemBg = const Color.fromARGB(255, 0, 0, 0),
  })  : _name = name,
        _bottomNavigationBarItemColor = bottomNavigationBarItemColor,
        _background = background,
        _jobsButton = jobsButton,
        _secondary = secondary,
        _button = button,
        _buttonText = buttonText,
        _topLeftCornerCircle = topLeftCornerCircle,
        _text = text,
        _icon = icon,
        _hintText = hintText,
        _searchBar = searchBar,
        _searchHint = searchHint,
        _searchText = searchText,
        _itemBackground = itemBackground,
        _bottomSheetHintText = bottomSheetHintText,
        _bottomSheetHintText2 = bottomSheetHintText2,
        _bottomSheetHintText3 = bottomSheetHintText3,
        _inactiveBtnColor = inactiveBtnColor,
        _error = error,
        _bottomSheetTitle = bottomSheetTitle,
        _bottomSheetSearchBar = bottomSheetSearchBar,
        _bottomSheetItemBg = bottomSheetItemBg,
        _bottomSheetText = bottomSheetText,
        _bottomSheetStick = bottomSheetStick,
        _bottomErrorIconBg = bottomErrorIconBg,
        _bottomErrorIcon = bottomErrorIcon,
        _bottomSheetBg = bottomSheetBg,
        _dateTimePickerBg = dateTimePickerBg,
        _dateTimePickerItemBg = dateTimePickerItemBg;

  Appearance.dark({
    String name = "dark",
    Color background = const Color(0xFF1B1C24),
    Color bottomNavigationBarItemColor = const Color(0xFFFFFFFF),
    Color secondary = const Color(0xFF6D59BD),
    Color jobsButton = const Color(0xFFFF9800),
    List<Color> button = const [Color(0xFF6D59BD), Color(0xFF6145D0)],
    Color topLeftCornerCircle = const Color(0xFF26272f),
    Color text = const Color(0xFFF5F6FF),
    Color buttonText = const Color.fromARGB(255, 255, 255, 255),
    Color icon = const Color(0xFFF5F6FF),
    Color hintText = const Color.fromRGBO(245, 246, 255, 0.7),
    Color searchBar = const Color(0xFFFAFAFA),
    Color searchHint = const Color(0xFFAEAEAE),
    Color searchText = const Color.fromRGBO(0, 0, 0, 0.8),
    Color itemBackground = const Color(0xFF303239),
    Color bottomSheetHintText = const Color.fromRGBO(68, 75, 81, 0.7),
    Color bottomSheetHintText2 = const Color(0xFF939393),
    Color bottomSheetHintText3 = const Color.fromRGBO(0, 0, 0, 0.4),
    Color inactiveBtnColor = const Color.fromRGBO(131, 131, 150, 0.5),
    Color error = const Color(0xFFFF5494),
    Color bottomSheetTitle = const Color(0xFF1B1C24),
    Color bottomSheetSearchBar = const Color.fromRGBO(14, 14, 14, 0.1),
    Color bottomSheetItemBg = const Color(0xFFC4C4C4),
    Color bottomSheetText = const Color.fromRGBO(27, 28, 36, 0.7),
    Color bottomSheetStick = const Color(0xFF1B1C24),
    Color bottomErrorIconBg = const Color(0xFFCC0000),
    Color bottomErrorIcon = const Color(0xFFFAFAFA),
    Color bottomSheetBg = const Color(0xFFE1E1E1),
    Color dateTimePickerBg = const Color(0xFFd1d3d9),
    Color dateTimePickerItemBg = const Color(0xFFFAFAFA),
  })  : _name = name,
        _background = background,
        _secondary = secondary,
        _button = button,
        _buttonText = buttonText,
        _bottomNavigationBarItemColor = bottomNavigationBarItemColor,
        _topLeftCornerCircle = topLeftCornerCircle,
        _text = text,
        _icon = icon,
        _hintText = hintText,
        _searchBar = searchBar,
        _jobsButton = jobsButton,
        _searchHint = searchHint,
        _searchText = searchText,
        _itemBackground = itemBackground,
        _bottomSheetHintText = bottomSheetHintText,
        _bottomSheetHintText2 = bottomSheetHintText2,
        _bottomSheetHintText3 = bottomSheetHintText3,
        _inactiveBtnColor = inactiveBtnColor,
        _error = error,
        _bottomSheetTitle = bottomSheetTitle,
        _bottomSheetSearchBar = bottomSheetSearchBar,
        _bottomSheetItemBg = bottomSheetItemBg,
        _bottomSheetText = bottomSheetText,
        _bottomSheetStick = bottomSheetStick,
        _bottomErrorIconBg = bottomErrorIconBg,
        _bottomErrorIcon = bottomErrorIcon,
        _bottomSheetBg = bottomSheetBg,
        _dateTimePickerBg = dateTimePickerBg,
        _dateTimePickerItemBg = dateTimePickerItemBg;
}
