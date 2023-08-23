import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/constants/constants.dart';
import 'src/controller/home_tabs_controller.dart';
import 'src/controller/image_get_controller.dart';
import 'src/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Text Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.primaryOrange,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade300,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Constants.primaryOrange
        ),
      ),
      home: const SplashScreen(),
      initialBinding: AppBindings(),
    );
  }
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeTabsController());
    Get.put(ImageGetController());
  }

}