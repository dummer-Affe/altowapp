class RegexConstants {
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordRegex = r"^.{6,}$";
  static const String userNameRegex = r"^.{4,}$";
  static const String consecutiveRegex = r'01|12|23|34|45|56|67|78|89';
  static const String repeatingRegex = r'(.)\1{1}';
}
