import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_tabs_controller.dart';
import '../components/home_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: GetBuilder<HomeTabsController>(
        builder: (controller) {
          return controller.tabs[controller.currentIndex];
        },
      ),
      extendBody: true,
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}