import 'package:flutter/material.dart';

import '../../altow_academy/view/altow_academy_view.dart';
import '../../home/view/home_view.dart';
import '../../jobs/view/jobs_view.dart';
import '../../success_stories/view/success_stories_view.dart';
import '../../ueber_uns/view/ueber_uns_view.dart';

extension HomeBasePageEnumExt on HomeBasePageEnum {
  String get name {
    switch (this) {
      case HomeBasePageEnum.successStories:
        return "successStories";
      case HomeBasePageEnum.jobs:
        return "jobs";
      case HomeBasePageEnum.home:
        return "home";
      case HomeBasePageEnum.altowAcademy:
        return "altowAcademy";
      case HomeBasePageEnum.ueberUns:
        return "ueberUns";
    }
  }

  String get getTitle {
    switch (this) {
      case HomeBasePageEnum.successStories:
        return "Stories";
      case HomeBasePageEnum.jobs:
        return "Jobs";
      case HomeBasePageEnum.home:
        return "Home";
      case HomeBasePageEnum.altowAcademy:
        return "Academy";
      case HomeBasePageEnum.ueberUns:
        return "Über Uns";
    }
  }

  IconData get getIcon {
    switch (this) {
      case HomeBasePageEnum.successStories:
        return Icons.assignment_turned_in;
      case HomeBasePageEnum.jobs:
        return Icons.work;
      case HomeBasePageEnum.home:
        return Icons.home;
      case HomeBasePageEnum.altowAcademy:
        return Icons.school;
      case HomeBasePageEnum.ueberUns:
        return Icons.info;
    }
  }

  Widget get getPage {
    switch (this) {
      case HomeBasePageEnum.successStories:
        return const SuccessStoriesView();
      case HomeBasePageEnum.jobs:
        return const JobsView();
      case HomeBasePageEnum.home:
        return const HomeView();
      case HomeBasePageEnum.altowAcademy:
        return const AltowAcademyView();
      case HomeBasePageEnum.ueberUns:
        return const UeberUnsView();
    }
  }
}

enum HomeBasePageEnum { successStories, jobs, home, altowAcademy, ueberUns }
