import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/states/app_colors/app_colors.dart';
import '/core/states/app_fonts/app_fonts_panel.dart';
import '/core/states/app_settings/app_settings.dart';
import '../../core/constants/icon_paths.dart';
import '../../core/constants/image_paths.dart';
import '../../product/widgets/sized_button/sized_button.dart';
import '../base/context_updater.dart';

class BaseDesign extends StatelessWidget {
  final Function()? onBackButtonPressed;
  final Function()? onSubmitButtonPressed;
  final String? submitButtonText, title, text, middleTitle;
  final Color submitButtonColor;
  final Widget child;
  final Widget? bottomWidget;
  final Future<bool> Function()? onWillPop;
  final EdgeInsetsGeometry? padding, staticAreaPadding, submitBtnPadding;
  final double topPadding, backBtnTopPosition;
  final bool noBackBtn, noSubmitBtn, noCurve, noCircle, listView;
  final PopupMenuButton? popupMenuButton;
  final double bottomPadding, backBtnLeftPadding;
  final double bottomPaddingValue;
  final Widget? bottomNavigationBar;
  final Gradient? gradient;
  final Color backgroundColor;
  final Widget? topRightIcon;
  BaseDesign({
    super.key,
    this.onBackButtonPressed,
    this.onSubmitButtonPressed,
    this.title,
    this.topRightIcon,
    this.text,
    this.submitBtnPadding,
    this.backBtnTopPosition = 56,
    this.gradient,
    this.backBtnLeftPadding = 17,
    Color? backgroundColor,
    this.bottomWidget,
    this.padding,
    this.onWillPop,
    this.staticAreaPadding,
    this.noBackBtn = false,
    this.noSubmitBtn = false,
    this.popupMenuButton,
    this.listView = false,
    this.middleTitle,
    this.noCircle = false,
    this.bottomNavigationBar,
    this.bottomPadding = 25,
    this.bottomPaddingValue = 0,
    this.topPadding = 120,
    this.noCurve = false,
    this.submitButtonText,
    this.submitButtonColor = const Color(0xFF6D59BD),
    required this.child,
  }) : backgroundColor = backgroundColor ?? AppColors.background;

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return GetBuilder<AppSettings>(builder: (controller) {
      return ContextUpdater(
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Container(
              decoration: BoxDecoration(gradient: gradient),
              child: Stack(
                children: [
                  if (!noCurve)
                    Padding(
                      padding:
                          EdgeInsets.only(top: figma.px(37, Axis.vertical)),
                      child: Image.asset(
                        ImagePaths.curve,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  if (!noCurve)
                    Image.asset(
                      ImagePaths.curve2,
                      height: figma.px(270, Axis.vertical),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  if (!noCircle)
                    Positioned(
                      left: -figma.px(182, Axis.horizontal),
                      top: -figma.px(206, Axis.vertical),
                      child: Container(
                        width: figma.px(286, Axis.vertical),
                        height: figma.px(286, Axis.vertical),
                        decoration: BoxDecoration(
                            color: AppColors.topLeftCornerCircle,
                            shape: BoxShape.circle),
                      ),
                    ),
                  listView ? listViewMode(context) : columViewMode(context),
                  if (!noBackBtn ||
                      popupMenuButton != null ||
                      middleTitle != null)
                    Positioned(
                      top: figma.px(backBtnTopPosition, Axis.vertical),
                      child: SizedBox(
                        height: figma.px(50, Axis.vertical),
                        width: context.width,
                        child: Padding(
                          padding: figma.paddingOnly(
                              left: backBtnLeftPadding, right: 20),
                          child: Stack(children: [
                            !noBackBtn
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconButton(
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: figma.paddingAll(8),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          if (onBackButtonPressed != null) {
                                            onBackButtonPressed!();
                                          }
                                        },
                                        icon: Image.asset(
                                          IconPaths.back,
                                          color: AppColors.text,
                                          height: figma.px(17, Axis.vertical),
                                        )))
                                : const SizedBox(),
                            if (middleTitle != null)
                              Center(
                                child: Text(
                                  middleTitle!,
                                  style: AppFontsPanel.baseTitleMid,
                                ),
                              ),
                            if (topRightIcon != null)
                              Align(
                                alignment: Alignment.centerRight,
                                child: topRightIcon,
                              )
                          ]),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      );
    });
  }

  Widget listViewMode(BuildContext context) {
    var figma = Figma.of(context);
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(horizontal: AppFontsPanel.horizontalPadding),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          figma.spacer(topPadding, Axis.vertical),
          if (title != null && text != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: staticAreaPadding ?? EdgeInsets.zero,
                  child: FigmaText(
                    title!,
                    height: 32,
                    style: AppFontsPanel.titleStyle,
                  ),
                ),
                figma.spacer(5, Axis.vertical),
                Padding(
                  padding: staticAreaPadding ?? EdgeInsets.zero,
                  child: FigmaText(
                    text!,
                    height: 23,
                    style: AppFontsPanel.secondTitleStyle,
                  ),
                ),
                figma.spacer(32, Axis.vertical)
              ],
            ),
          child,
          if (!noSubmitBtn)
            Padding(
              padding:
                  submitBtnPadding ?? (staticAreaPadding ?? EdgeInsets.zero),
              child: SizedButton(
                width: double.infinity,
                height: AppFontsPanel.buttonHeight,
                radius: 14,
                linearGradient: LinearGradient(
                    colors: AppColors.button,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderWith: 1,
                onPressed: () {
                  if (onSubmitButtonPressed != null) {
                    onSubmitButtonPressed!();
                  }
                },
                child: Text(submitButtonText ?? "",
                    style: AppFontsPanel.smallText),
              ),
            ),
          figma.spacer(bottomPadding, Axis.vertical),
        ],
      ),
    );
  }

  Widget columViewMode(BuildContext context) {
    var figma = Figma.of(context);
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                    horizontal: AppFontsPanel.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                figma.spacer(topPadding, Axis.vertical),
                if (title != null && text != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: staticAreaPadding ?? EdgeInsets.zero,
                        child: FigmaText(
                          title!,
                          height: 32,
                          style: AppFontsPanel.titleStyle,
                        ),
                      ),
                      figma.spacer(5, Axis.vertical),
                      Padding(
                        padding: staticAreaPadding ?? EdgeInsets.zero,
                        child: FigmaText(
                          text!,
                          height: 23,
                          style: AppFontsPanel.secondTitleStyle,
                        ),
                      ),
                      figma.spacer(32, Axis.vertical)
                    ],
                  ),
                Expanded(
                  child: child,
                ),
                if (!noSubmitBtn)
                  Padding(
                    padding: submitBtnPadding ??
                        (staticAreaPadding ?? EdgeInsets.zero),
                    child: SizedButton(
                      width: double.infinity,
                      height: AppFontsPanel.buttonHeight,
                      radius: 14,
                      linearGradient: LinearGradient(
                          colors: AppColors.button,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderWith: 1,
                      onPressed: () {
                        if (onSubmitButtonPressed != null) {
                          onSubmitButtonPressed!();
                        }
                      },
                      child: Text(submitButtonText ?? "",
                          style: AppFontsPanel.smallText),
                    ),
                  ),
                figma.spacer(bottomPadding, Axis.vertical),
                figma.spacer(bottomPaddingValue, Axis.vertical),
              ],
            ),
          ),
        ),
        if (bottomWidget != null) bottomWidget!
      ],
    );
  }
}
