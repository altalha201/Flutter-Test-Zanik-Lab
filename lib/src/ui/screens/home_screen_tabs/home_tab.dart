import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/image_get_controller.dart';
import '../../../data/models/product_model.dart';
import '../../components/category_item.dart';
import '../../components/pop_message.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _categories = [];
  bool _showDialogBox = false;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      var allItems = [];
      for (ProductModel element
          in Get.find<ImageGetController>().data.products ?? []) {
        allItems.add(element.category);
      }
      _categories.addAll(allItems.toSet());
      setState(() {});
      Future.delayed(const Duration(seconds: 2)).then((_) {
        setState(() {
          _showDialogBox = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swipe XYZ",
          style: GoogleFonts.lobster(
            wordSpacing: 1.7,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 32.0,
                    runSpacing: 24.0,
                    alignment: WrapAlignment.center,
                    children: _categories
                        .map(
                          (c) => CategoryItem(category: c),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: _showDialogBox,
            replacement: const SizedBox.shrink(),
            child: const PopMessage(),
          ),
        ],
      ),
    );
  }
}
