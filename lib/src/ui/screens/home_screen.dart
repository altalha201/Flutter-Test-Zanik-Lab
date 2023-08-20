import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controller/image_get_controller.dart';
import '../components/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Get.find<ImageGetController>().fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppbar(),
          Expanded(
            child: GetBuilder<ImageGetController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.data.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.data.products?.elementAt(index).title ?? "XRT"),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black87,
        selectedItemColor: Constants.primaryOrange,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
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
      ),
    );
  }
}
