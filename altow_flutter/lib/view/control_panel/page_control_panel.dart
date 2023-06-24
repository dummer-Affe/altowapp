import '/core/states/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../core/states/app_settings/app_settings.dart';

class PageControlPanel extends StatelessWidget {
  PageControlPanel(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  final List<String> paths = [
    "IconPaths.home",
    "IconPaths.cart",
    "IconPaths.like",
    "IconPaths.profile"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      return Scaffold(
        body: navigationShell,
        backgroundColor: AppSettings.instance.appearance.secondary,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          child: BottomNavigationBar(
            backgroundColor: AppColors.secondary,
            currentIndex: navigationShell.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              for (int i = 0; i < paths.length; i++)
                BottomNavigationBarItem(
                  backgroundColor: AppSettings.instance.appearance.secondary,
                  icon: Icon(Icons.abc,
                      size: 50,
                      color: i == navigationShell.currentIndex
                          ? AppColors.text
                          : AppColors.text.withOpacity(0.7)),
                  label: '',
                ),
            ],
            onTap: _onTap,
          ),
        ),
      );
    });
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
