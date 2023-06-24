import 'package:get/get.dart';

import 'home_base_page.dart';

class HomeBasePageController extends GetxController {
  static HomeBasePageController get init => Get.put(HomeBasePageController());
  static HomeBasePageController get instance =>
      Get.find<HomeBasePageController>();

  HomeBasePageController() {
    currentPage = HomeBasePageEnum.home;
    pageStack.add(currentPage);
  }

  late HomeBasePageEnum currentPage;
  List<HomeBasePageEnum> pageStack = [];

  List<HomeBasePageEnum> get pages => [
        HomeBasePageEnum.home,
        HomeBasePageEnum.jobs,
        HomeBasePageEnum.successStories,
        HomeBasePageEnum.altowAcademy,
        HomeBasePageEnum.ueberUns
      ];

  void navigatePage(HomeBasePageEnum page) {
    currentPage = page;
    pageStack.add(currentPage);
    update();
  }

  void navigateToIndex(int index) {
    currentPage = pages[index];
    pageStack.add(currentPage);
    update();
  }

  int get currentIndex => pages.indexOf(currentPage);

  bool pop() {
    if (pageStack.length > 1) {
      pageStack.removeLast();
      currentPage = pageStack.last;
      update();
      print("true");
      return false;
    } else {
      print("false");
      return true;
    }
  }
}
