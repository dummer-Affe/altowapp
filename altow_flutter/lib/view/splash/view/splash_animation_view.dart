// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/icon_paths.dart';

class SplashAnimationView extends StatefulWidget {
  const SplashAnimationView(
      {Key? key, required this.onFinishAnimation, this.isFadeStart = false})
      : super(key: key);

  final Function onFinishAnimation;
  final bool isFadeStart;

  @override
  State<SplashAnimationView> createState() => SplashAnimationViewState();
}

class SplashAnimationViewState extends State<SplashAnimationView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  initState() {
    super.initState();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    animationController!.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        animationController!.animateTo(0);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedScale(
          duration: const Duration(milliseconds: 500),
          scale: widget.isFadeStart ? 5 : 1,
          child: Center(
            child: Column(
              children: [
                Image.asset(IconPaths.altowIcon, width: context.width / 2),
              ],
            ),
          ),
          onEnd: () {
            widget.onFinishAnimation();
          },
        ),
      ],
    ));
  }
}
