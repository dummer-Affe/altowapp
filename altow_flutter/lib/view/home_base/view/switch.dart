import 'package:altow_projects/core/states/app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../core/states/app_colors/app_colors.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 70.0,
      height: 35.0,
      toggleSize: 25.0,
      value: AppSettings.instance.isDarkMode,
      borderRadius: 30.0,
      padding: 2.0,
      activeToggleColor: AppColors.secondary,
      inactiveToggleColor: const Color(0xFF2F363D),
      activeSwitchBorder: Border.all(
        color:  AppColors.secondary,
        width: 4.0,
      ),
      inactiveSwitchBorder: Border.all(
        color: const Color(0xFFD1D5DA),
        width: 4.0,
      ),
      activeColor: const Color(0xFF271052),
      inactiveColor: Colors.white,
      activeIcon: const Icon(
        Icons.nightlight_round,
        color: Color(0xFFF8E3A1),
      ),
      inactiveIcon: const Icon(
        Icons.wb_sunny,
        color: Color(0xFFFFDF5D),
      ),
      onToggle: (val) {
        setState(() {
          AppSettings.instance.changeTheme();
        });
      },
    );
  }
}
