import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../model/success_stories_view_model.dart';
import 'story_widget.dart';

class SuccessStoriesView extends StatefulWidget {
  const SuccessStoriesView({super.key});

  @override
  State<SuccessStoriesView> createState() => _SuccessStoriesViewState();
}

class _SuccessStoriesViewState extends State<SuccessStoriesView> {
  var model = SuccessStoriesViewModel();

  @override
  void initState() {
    //storyId: widget.storyID
    WidgetsBinding.instance
        .addPostFrameCallback((_) => model.init(context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      var figma = Figma.of(context);
      return Observer(
        builder: (context) => switch (model.serviceStatus) {
          ServiceStatus.failed => Center(
              child: Icon(
                Icons.warning,
                color: Colors.orangeAccent,
                size: figma.px(50, Axis.horizontal),
              ),
            ),
          ServiceStatus.onProcess =>
            const Center(child: CircularProgressIndicator()),
          ServiceStatus.waiting => const SizedBox(),
          ServiceStatus.success => Column(
              children: [
                //  Text(
                //    "Success Stories",
                //    textAlign: TextAlign.left,
                //    style: AppFontsPanel.titleStyle,
                //  ),
                for (var story in model.stories!.stories!)
                  StoryWidget(story: story, model: model, id: story.id!)
              ],
            ),
        },
      );
    });
  }
}
