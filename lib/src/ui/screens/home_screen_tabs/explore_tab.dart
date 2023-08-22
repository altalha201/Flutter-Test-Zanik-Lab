import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../controller/image_get_controller.dart';
import '../../components/custom_search_appbar.dart';
import '../../components/explore_item.dart';
import '../../components/product_dialog.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({
    super.key,
  });

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 45),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSearchAppbar(height: 120),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ImageGetController>(
          builder: (controller) {
            return GridView.custom(
              controller: _scrollController,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  // QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: controller.data.products?.length ?? 0,
                (context, index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ExploreItem(
                    imgUrl:
                        controller.data.products?.elementAt(index).thumbnail,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ProductDialog(
                              item: controller.data.products!.elementAt(index),
                            );
                          });
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
