class InputRule {
  String regex;
  bool? isValid;
  String text;
  InputRule({required this.regex, this.isValid, required this.text});

  InputRule validate(String text) {
    isValid = RegExp(regex).hasMatch(text)
        ? false
        : text.length == 6
            ? true
            : null;
    return InputRule(regex: regex, text: this.text, isValid: isValid);
  }
}
