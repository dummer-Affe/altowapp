import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/view/home_base/model/home_base_page.dart';
import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/app_text/homepage_texts.dart';
import '../../../product/widgets/carousel_widget.dart';
import '../../../product/widgets/paragraph_widget.dart';
import '../model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var model = HomeViewModel();

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  final List<String> firstGroupImages = [
    ImagePaths.homePic1,
    ImagePaths.homePic2,
    ImagePaths.homePic3,
    ImagePaths.homePic4,
  ];
  final List<String> secondGroupImages = [
    ImagePaths.homePic5,
    ImagePaths.homePic6,
    ImagePaths.homePic7,
    ImagePaths.homePic8,
    ImagePaths.homePic9,
    ImagePaths.homePic10,
    ImagePaths.homePic11,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(
        builder: (controller) => Column(
              children: [
                Padding(
                  padding: AppFontsPanel.verticalImagePadding,
                  child: Image.asset(ImagePaths.homePic0),
                ),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      paragraph: HomePageTexts.paragraph_1,
                      title: HomePageTexts.title,
                      button: true,
                      destinationPage: HomeBasePageEnum.ueberUns,
                      buttonText: "MEHR ÜBER UNSER UNTERNEHMEN"),
                ),
                FigmaBox(
                  height: 300,
                  child: CarouselWidget(imagePathList: firstGroupImages),
                ),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      paragraph: HomePageTexts.paragraph_2,
                      title: HomePageTexts.title_2,
                      button: true,
                      destinationPage: HomeBasePageEnum.successStories,
                      buttonText: "MEHR ÜBER UNSERE REFERENZEN"),
                ),
                FigmaBox(
                  height: 300,
                  child: CarouselWidget(imagePathList: secondGroupImages),
                ),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      paragraph: HomePageTexts.paragraph_3,
                      title: HomePageTexts.title_3,
                      destinationPage: HomeBasePageEnum.jobs,
                      button: true,
                      buttonText: "ZU UNSEREN JOBS"),
                ),
              ],
            ));
  }
}
