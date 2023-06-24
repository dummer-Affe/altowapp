import 'package:altow_projects/core/states/app_user/app_user.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/states/app_colors/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
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
