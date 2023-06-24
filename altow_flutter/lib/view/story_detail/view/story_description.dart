import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/model/success_story_response/story_response_model.dart';

class StoryDescriptionWidget extends StatelessWidget {
  final SuccessStoryResponse? story;
  const StoryDescriptionWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    List<String> storyParagraphs = story!.storyParagraph!.split("/n");
    List<String> storyPictures = story!.contentImageLinks!;
    return Column(
      children: [
        for (int i = 0; i < storyParagraphs.length; i++)
          Column(
            children: [
              Padding(
                padding: AppFontsPanel.horizontalContentPadding,
                child: Text(
                  storyParagraphs[i],
                  style: AppFontsPanel.paragraphStyle,
                ),
              ),
              if (i < storyPictures.length)
                Padding(
                  padding: AppFontsPanel.verticalImagePadding,
                  child: CachedNetworkImage(imageUrl: storyPictures[i]),
                )
            ],
          )
      ],
    );
  }
}
