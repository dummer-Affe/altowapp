import 'package:cached_network_image/cached_network_image.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

import '/core/states/app_colors/app_colors.dart';
import '/core/states/app_fonts/app_fonts_panel.dart';
import '/product/functions/my_functions.dart';
import '../../../product/model/success_story_response/story_response_model.dart';
import '../model/success_stories_view_model.dart';

class StoryWidget extends StatelessWidget {
  final SuccessStoryResponse story;
  final SuccessStoriesViewModel model;
  final int id;
  const StoryWidget(
      {super.key, required this.story, required this.model, required this.id});

  @override
  Widget build(BuildContext context) {
    var figma = Figma.of(context);
    return TextButton(
      style: zeroPaddingTextButton(),
      onPressed: () {
        model.goToDetailPage(context: context, id: id);
      },
      child: Column(
        children: [
          Padding(
            padding: AppFontsPanel.verticalImagePadding,
            child: CachedNetworkImage(
              imageUrl: story.coverImageLinks![0],
            ),
          ),
          Padding(
            padding: figma.paddingOnly(bottom: 5),
            child: FigmaBox(
              width: double.infinity,
              child: Padding(
                padding: AppFontsPanel.horizontalContentPadding,
                child: Text(
                  story.organizationName!,
                  textAlign: TextAlign.left,
                  style: AppFontsPanel.storyGiverStyle,
                ),
              ),
            ),
          ),
          Padding(
            padding: AppFontsPanel.horizontalContentPadding,
            child: FigmaBox(
              width: double.infinity,
              child: Text(
                story.title!,
                textAlign: TextAlign.left,
                style: AppFontsPanel.thirdTitleStyle,
              ),
            ),
          ),
          Padding(
            padding: figma.paddingOnly(top: AppFontsPanel.imagePadding),
            child: Divider(
              color: AppColors.hintText,
            ),
          )
        ],
      ),
    );
  }
}
