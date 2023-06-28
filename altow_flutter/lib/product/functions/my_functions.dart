import 'package:flutter/material.dart';

ButtonStyle zeroPaddingTextButton() {
  return TextButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
