import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/init/app_text/ueberuns_page_texts.dart';
import '../../../product/widgets/carousel_widget.dart';
import '../../../product/widgets/paragraph_widget.dart';

class UeberUnsView extends StatefulWidget {
  const UeberUnsView({super.key});

  @override
  State<UeberUnsView> createState() => _UeberUnsViewState();
}

class _UeberUnsViewState extends State<UeberUnsView> {
  late VideoPlayerController _controller;
  final List<String> firstGroupImages = [
    ImagePaths.ueberUnsPic1,
    ImagePaths.ueberUnsPic2,
    ImagePaths.ueberUnsPic3,
    ImagePaths.ueberUnsPic4,
  ];
  final List<String> secondGroupImages = [
    ImagePaths.ueberUnsPic5,
    ImagePaths.ueberUnsPic6,
    ImagePaths.ueberUnsPic7,
    ImagePaths.ueberUnsPic8,
    ImagePaths.ueberUnsPic9,
    ImagePaths.ueberUnsPic10,
    ImagePaths.ueberUnsPic11,
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/images/ueberUnsJPG/trailer.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return GetBuilder<AppSettings>(
        builder: (context) => Column(
              children: [
                Padding(
                  padding: AppFontsPanel.verticalImagePadding,
                  child: Image.asset(ImagePaths.ueberUnsPic0),
                ),
                const FigmaBox(
                  height: 15,
                ),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      button: false,
                      paragraph: UeberUnsPageTexts.paragraph_1,
                      title: UeberUnsPageTexts.title,
                      buttonText: ""),
                ),
                _controller.value.isInitialized
                    ? Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Opacity(
                              opacity: _controller.value.isPlaying ? 0 : 1,
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4)),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: figma.px(80, Axis.horizontal),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const FigmaBox(),
                const FigmaBox(
                  height: 15,
                ),
                Padding(
                  padding: figma.paddingSymmetric(horizontal: 10.0),
                  child: ParagraphWidget(
                      button: false,
                      paragraph: UeberUnsPageTexts.paragraph_2,
                      title: UeberUnsPageTexts.title_2,
                      buttonText: ""),
                ),
                const FigmaBox(
                  height: 15,
                ),
                FigmaBox(
                  height: 300,
                  child: CarouselWidget(
                    imagePathList: firstGroupImages,
                  ),
                ),
                const FigmaBox(
                  height: 15,
                ),
                Padding(
                  padding: figma.paddingSymmetric(horizontal: 10.0),
                  child: ParagraphWidget(
                      button: false,
                      paragraph: UeberUnsPageTexts.paragraph_3,
                      title: UeberUnsPageTexts.title_3,
                      buttonText: ""),
                ),
                const FigmaBox(
                  height: 15,
                ),
                FigmaBox(
                  height: 300,
                  child: CarouselWidget(
                    imagePathList: secondGroupImages,
                  ),
                ),
              ],
            ));
  }
}
