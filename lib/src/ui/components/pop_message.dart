import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controller/home_tabs_controller.dart';

class PopMessage extends StatelessWidget {
  const PopMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            child: Card(
              elevation: 4,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "The Feature Not implemented yet.\nGo to explore section.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16.0),
                  FilledButton(
                    onPressed: () {
                      Get.find<HomeTabsController>().updateTab(1);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Constants.primaryOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}