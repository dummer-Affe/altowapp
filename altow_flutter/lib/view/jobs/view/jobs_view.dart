import '/core/init/navigation/navigation_enums.dart';
import '/core/init/navigation/navigation_service.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/states/app_fonts/app_fonts_panel.dart';
import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/app_text/jobs_page_texts.dart';
import '../../../product/widgets/carousel_widget.dart';
import '../../../product/widgets/sized_button/sized_button.dart';
import '../model/jobs_view_model.dart';

class JobsView extends StatefulWidget {
  const JobsView({super.key});

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  var model = JobsViewModel();
  List<String> imagePathList = [ImagePaths.jobsPic0, ImagePaths.jobsPic1];
  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return GetBuilder<AppSettings>(
        builder: (controller) => Column(children: [
              FigmaBox(
                height: 300,
                child: CarouselWidget(imagePathList: imagePathList),
              ),
              Padding(
                padding: AppFontsPanel.horizontalContentPadding,
                child: FigmaBox(
                  width: double.infinity,
                  child: Text(
                    JobsPageText.title,
                    textAlign: TextAlign.left,
                    style: AppFontsPanel.titleStyle,
                  ),
                ),
              ),
              const FigmaBox(
                height: 10,
              ),
              Padding(
                padding: figma.paddingSymmetric(horizontal: 10.0),
                child: FigmaBox(
                  width: double.infinity,
                  child: Text(
                    JobsPageText.paragraph,
                    textAlign: TextAlign.left,
                    style: AppFontsPanel.paragraphStyle,
                  ),
                ),
              ),
              const FigmaBox(
                height: 10,
              ),
              Padding(
                padding: figma.paddingSymmetric(horizontal: 10.0),
                child: FigmaBox(
                  width: double.infinity,
                  child: Text(
                    JobsPageText.paragraph_2,
                    textAlign: TextAlign.left,
                    style: AppFontsPanel.paragraphStyle,
                  ),
                ),
              ),
              const FigmaBox(
                height: 10,
              ),
              Padding(
                padding: figma.paddingSymmetric(horizontal: 10.0),
                child: FigmaBox(
                  width: double.infinity,
                  child: Text(
                    JobsPageText.paragraph_3,
                    textAlign: TextAlign.left,
                    style: AppFontsPanel.paragraphStyle,
                  ),
                ),
              ),
              const FigmaBox(
                height: 10,
              ),
              Padding(
                padding: figma.paddingSymmetric(horizontal: 10.0, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedButton(
                    radius: 3,
                    borderColor: Colors.orange.shade800,
                    width: 200,
                    height: 80,
                    onPressed: () {
                      NavigationService.push(NavigationEnums.webviewPage,
                          data: "https://altow.jobs.personio.de/");
                    },
                    child: Text(
                      "ZUM STELLENPORTAL",
                      style: AppFontsPanel.jobsButtonStyle,
                    ),
                  ),
                ),
              )
            ]));
  }
}
