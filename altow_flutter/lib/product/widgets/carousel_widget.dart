import '/core/states/app_fonts/app_fonts_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imagePathList;
  const CarouselWidget({super.key, required this.imagePathList});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: AppFontsPanel.verticalImagePadding,
      child: CarouselSlider.builder(
          unlimitedMode: true,
          slideBuilder: (index) {
            return Image.asset(
              imagePathList[index],
              fit: BoxFit.cover,
            );
          },
          slideTransform: const CubeTransform(),
          slideIndicator: CircularSlideIndicator(
            currentIndicatorColor: Colors.white.withOpacity(0.6),
            indicatorBackgroundColor: Colors.white.withOpacity(0.3),
            padding: const EdgeInsets.only(bottom: 32),
          ),
          itemCount: imagePathList.length),
    );
  }
}
