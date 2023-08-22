import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/home_screen_tabs/add_tab.dart';
import '../ui/screens/home_screen_tabs/explore_tab.dart';
import '../ui/screens/home_screen_tabs/home_tab.dart';
import '../ui/screens/home_screen_tabs/inbox_tab.dart';
import '../ui/screens/home_screen_tabs/shop_tab.dart';

class HomeTabsController extends GetxController {
  final List<Widget> _tabs = [
    const HomeTab(),
    const ExploreTab(),
    const AddTab(),
    const InboxTab(),
    const ShopTab()
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<Widget> get tabs => _tabs;

  void updateTab(int index) {
    _currentIndex = index;
    update();
  }
}