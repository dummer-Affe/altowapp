import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '/core/states/app_colors/app_colors.dart';
import '../../../../core/states/app_settings/app_settings.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/init/enum/service_status.dart';
import '../../base/context_updater.dart';
import '../../home_base/view/my_appbar.dart';
import '../model/story_detail_view_model.dart';
import 'story_description.dart';

class StoryDetailView extends StatefulWidget {
  final int? storyID;
  const StoryDetailView({super.key, required this.storyID});

  @override
  State<StoryDetailView> createState() => _StoryDetailViewState();
}

class _StoryDetailViewState extends State<StoryDetailView> {
  var model = StoryDetailViewModel();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => model.init(storyId: widget.storyID, context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContextUpdater(
      child: GetBuilder<AppSettings>(builder: (controller) {
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: const MyAppBar(),
            body: Observer(
              builder: (context) => switch (model.serviceStatus) {
                ServiceStatus.failed => const Center(
                    child: Icon(
                      Icons.warning,
                      color: Colors.orangeAccent,
                      size: 50,
                    ),
                  ),
                ServiceStatus.onProcess =>
                  const Center(child: CircularProgressIndicator()),
                ServiceStatus.waiting => const SizedBox(),
                ServiceStatus.success => ListView(
                    children: [
                      Column(children: [
                        Padding(
                          padding: AppFontsPanel.verticalImagePadding,
                          child: CachedNetworkImage(
                              imageUrl: model.story!.coverImageLinks![0]),
                        ),
                        Padding(
                          padding: AppFontsPanel.horizontalContentPadding,
                          child: FigmaBox(
                            width: double.infinity,
                            child: Text(
                              model.story!.organizationName!,
                              textAlign: TextAlign.left,
                              style: AppFontsPanel.storyGiverStyle,
                            ),
                          ),
                        ),
                        const FigmaBox(
                          height: 5,
                        ),
                        Padding(
                          padding: AppFontsPanel.horizontalContentPadding,
                          child: FigmaBox(
                            width: double.infinity,
                            child: Text(
                              model.story!.title!,
                              textAlign: TextAlign.left,
                              style: AppFontsPanel.titleStyle,
                            ),
                          ),
                        ),
                        StoryDescriptionWidget(
                          story: model.story,
                        ),
                      ]),
                    ],
                  ),
              },
            ));
      }),
    );
  }
}
