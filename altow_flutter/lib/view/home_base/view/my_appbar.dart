import 'package:altow_projects/core/states/app_user/app_user.dart';
import 'package:altow_projects/view/home_base/view/switch.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_colors/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool showThemeSwitcher;
  MyAppBar({super.key, this.showThemeSwitcher = true});

  @override
  Widget build(BuildContext context) {
    print(
      ImagePaths.altowLogoValid,
    );

    return AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leadingWidth: 80,
        
        leading: showThemeSwitcher
            ? const ThemeSwitcher()
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 31,
                ),
                color: AppColors.text,
              ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              AppUser.instance.logout();
            },
            icon: Icon(
              Icons.logout,
              color: AppColors.text,
            ),
          )
        ],
        title: Image.asset(
          ImagePaths.altowLogoValid,
          width: 150,
        ));
  }

  @override
  Size get preferredSize => const Size(10, 50);
}
