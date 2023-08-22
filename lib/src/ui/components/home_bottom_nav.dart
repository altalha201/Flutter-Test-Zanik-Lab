import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controller/home_tabs_controller.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeTabsController>(
      builder: (controller) {
        return BottomNavigationBar(
          onTap: (index) {
            controller.updateTab(index);
          },
          unselectedItemColor: Colors.black87,
          selectedItemColor: Constants.primaryOrange,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    color: Colors.black87),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline),
              label: "Inbox",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.business_center_outlined),
              label: "Shop",
            ),
          ],
        );
      }
    );
  }
}