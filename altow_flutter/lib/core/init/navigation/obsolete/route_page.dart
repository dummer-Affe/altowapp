import 'package:flutter/material.dart';

import '../navigation_enums.dart';

class RoutePage {
  NavigationEnums page;
  Widget pageView;

  RoutePage(this.page, this.pageView);
}
