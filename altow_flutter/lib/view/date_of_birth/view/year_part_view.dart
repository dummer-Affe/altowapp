import '/core/states/app_colors/app_colors.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../product/widgets/sized_button/sized_button.dart';
import '../../../product/widgets/textfield/textfield.dart';

class YearPartView extends StatefulWidget {
  final String hintText;
  final dynamic Function() onPressed;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final bool isSelected;
  final bool freeUsage;
  const YearPartView(
      {super.key,
      required this.hintText,
      required this.focusNode,
      required this.isSelected,
      this.freeUsage = false,
      required this.onChanged,
      required this.onPressed});

  @override
  State<YearPartView> createState() => _YearPartViewState();
}

class _YearPartViewState extends State<YearPartView> {
  bool focused = false;

  var controller = TextEditingController();

  @override
  void initState() {
    widget.focusNode.addListener(() {
      print("hasfocus:${widget.focusNode.hasFocus}");
      if (!widget.focusNode.hasFocus) {
        if (controller.text.length < 4) {
          controller.clear();
        }
        if (mounted) {
          setState(() {
            focused = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            focused = true;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
      child: FigmaContainer(
        width: 76,
        height: double.infinity,
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: focused || widget.isSelected
              ? RixaTextField(
                  width: figma.px(73, Axis.horizontal),
                  hintText: "2023",
                  radius: 7,
                  controller: controller,
                  isUnderline: false,
                  autoFocus: true,
                  focusNode: widget.focusNode,
                  focusedColor: Colors.transparent,
                  enabledColor: Colors.transparent,
                  showCursor: false,
                  textInputType: TextInputType.number,
                  linearGradient:
                      focused ? LinearGradient(colors: AppColors.button) : null,
                  textStyle: figma.style(
                      fontSize: 24,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w700),
                  hintStyle: figma.style(
                      fontSize: 24,
                      color: AppColors.hintText,
                      fontWeight: FontWeight.w700),
                  onChanged: (text) {
                    if (!widget.freeUsage &&
                        text.length == 4 &&
                        int.parse(text) > DateTime.now().year) {
                      controller.clear();
                    }
                    widget.onChanged(controller.text);
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                )
              : SizedButton(
                  onPressed: () {
                    setState(() {
                      focused = true;
                    });
                    widget.onPressed();
                  },
                  radius: 7,
                  width: figma.px(70, Axis.horizontal),
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    controller.text != "" ? controller.text : widget.hintText,
                    style: figma.style(
                        fontSize: 16,
                        color: AppColors.hintText,
                        fontWeight: FontWeight.w700),
                  ),
                ),
        ),
      ),
    );
  }
}
