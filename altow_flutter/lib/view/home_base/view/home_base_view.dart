import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

import '/core/states/app_colors/app_colors.dart';
import '/core/states/app_fonts/app_fonts_panel.dart';
import '/view/base/context_updater.dart';
import '/view/home_base/model/home_base_page.dart';
import '/view/home_base/model/home_base_page_controller.dart';
import '../../../core/states/app_settings/app_settings.dart';
import 'my_appbar.dart';

class HomeBaseView extends StatefulWidget {
  HomeBaseView({super.key}) {
    if (!GetInstance().isRegistered<HomeBasePageController>()) {
      HomeBasePageController.init;
    }
  }

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.bottomNavigationBar.tabListener(_onTap);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      print(controller.appearance.name);
      return ContextUpdater(
        child: WillPopScope(
          onWillPop: () async {
            return HomeBasePageController.instance.pop();
          },
          child: Scaffold(
            appBar: MyAppBar(),
            body: GetBuilder<HomeBasePageController>(
              builder: (pagcontroller) => ListView(
                controller: scrollController,
                children: [
                  pagcontroller.currentPage.getPage,
                ],
              ),
            ),
            backgroundColor: AppSettings.instance.appearance.background,
            bottomNavigationBar:
                GetBuilder<HomeBasePageController>(builder: (pageController) {
              return ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(22)),
                child: ScrollBottomNavigationBar(
                  controller: scrollController,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  backgroundColor: AppColors.secondary,
                  currentIndex: pageController.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    for (var page in pageController.pages)
                      BottomNavigationBarItem(
                        backgroundColor: AppColors.secondary,
                        icon: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(page.getIcon,
                                  size: 30,
                                  color: pageController.pages.indexOf(page) ==
                                          pageController.currentIndex
                                      ? AppColors.bottomNavigationBarItemColor
                                      : AppColors.bottomNavigationBarItemColor
                                          .withOpacity(0.3)),
                              Text(
                                page.getTitle,
                                overflow: TextOverflow.ellipsis,
                                style: AppFontsPanel.bottomSheetLabelText,
                              )
                            ],
                          ),
                        ),
                        label: '',
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    });
  }

  void _onTap(index) {
    HomeBasePageController.instance.navigateToIndex(index);
  }
}
