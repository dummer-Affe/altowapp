import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/states/app_fonts/app_fonts_panel.dart';
import '/core/states/app_settings/app_settings.dart';
import '../../../core/constants/image_paths.dart';
import '../../../product/init/app_text/page_texts.dart';
import '../../../product/widgets/carousel_widget.dart';
import '../../../product/widgets/paragraph_widget.dart';
import '../model/veranstaltungen.dart';
import 'veranstaltung_widget.dart';

class AltowAcademyView extends StatefulWidget {
  const AltowAcademyView({super.key});

  @override
  State<AltowAcademyView> createState() => _AltowAcademyViewState();
}

class _AltowAcademyViewState extends State<AltowAcademyView> {
  List<String> imagePathList = [
    ImagePaths.altowPic0,
    ImagePaths.altowPic1,
    ImagePaths.altowPic2,
  ];
  List<String> imagePathList_2 = [
    ImagePaths.altowPic3,
    ImagePaths.altowPic4,
    ImagePaths.altowPic5,
  ];
  List<Veranstaltung> veranstaltungen = [
    Veranstaltung(
        buttonName: "ZU DEN TICKETS",
        title: AltowAcademyPageText.vTitle_0,
        paragraph: AltowAcademyPageText.vParagraph_0,
        category: "ALTOW ACADEMY",
        url:
            "https://www.eventbrite.de/e/work-greater-2-fuhrung-im-wandel-tickets-615531851337",
        dateOf: "12.Mai"),
    Veranstaltung(
        buttonName: "ZUR ANMELDUNG",
        title: AltowAcademyPageText.vTitle_1,
        paragraph: AltowAcademyPageText.vParagraph_1,
        category: "ALTOW INSPIRE",
        url:
            "https://www.meetup.com/de-DE/login/?returnUri=https%3A%2F%2Fwww.meetup.com%2Faltow-academy%2Fevents%2F291156837",
        dateOf: "21.märz"),
    Veranstaltung(
        buttonName: "ZUR ANMELDUNG",
        title: AltowAcademyPageText.vTitle_2,
        paragraph: AltowAcademyPageText.vParagraph_2,
        category: "ALTOW INSPIRE",
        url:
            "https://www.meetup.com/de-DE/login/?returnUri=https%3A%2F%2Fwww.meetup.com%2Faltow-academy%2Fevents%2F291159616",
        dateOf: "21.FEB."),
    Veranstaltung(
        buttonName: "ZUR ANMELDUNG",
        title: AltowAcademyPageText.vTitle_3,
        paragraph: AltowAcademyPageText.vParagraph_3,
        category: "ALTOW INSPIRE",
        url:
            "https://www.meetup.com/login/?returnUri=https%3A%2F%2Fwww.meetup.com%2Faltow-academy%2Fevents%2F290613765",
        dateOf: "24.Jan"),
    Veranstaltung(
        buttonName: "ZUR ANMELDUNG",
        title: AltowAcademyPageText.vTitle_4,
        paragraph: AltowAcademyPageText.vParagraph_4,
        category: "ALTOW INSPIRE",
        url: "https://www.altow.de/altow-academy",
        dateOf: "15.DEZ."),
    Veranstaltung(
        buttonName: "ZU DEN TICKETS",
        title: AltowAcademyPageText.vTitle_5,
        paragraph: AltowAcademyPageText.vParagraph_5,
        category: "ALTOW ACADEMY",
        url:
            "https://www.eventbrite.de/e/work-greater-arbeitswelt-im-wandel-tickets-449378682737",
        dateOf: "11.NOV."),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(
        builder: (controller) => Column(
              children: [
                FigmaBox(
                    height: 300,
                    child: CarouselWidget(imagePathList: imagePathList)),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      button: false,
                      paragraph: AltowAcademyPageText.paragraph_0,
                      title: AltowAcademyPageText.title,
                      buttonText: ""),
                ),
                FigmaBox(
                    height: 300,
                    child: CarouselWidget(imagePathList: imagePathList_2)),
                const FigmaBox(
                  height: 10,
                ),
                Padding(
                  padding: AppFontsPanel.horizontalContentPadding,
                  child: ParagraphWidget(
                      button: false,
                      paragraph: AltowAcademyPageText.paragraph_1,
                      title: AltowAcademyPageText.title_2,
                      buttonText: ""),
                ),
                Text(
                  "Unsere Veranstaltungen",
                  textAlign: TextAlign.center,
                  style: AppFontsPanel.titleStyle,
                ),
                const FigmaBox(
                  height: 15,
                ),
                for (var i in veranstaltungen)
                  Padding(
                    padding: AppFontsPanel.horizontalContentPadding,
                    child: VeranstaltungWidget(veranstaltung: i),
                  )
              ],
            ));
  }
}
