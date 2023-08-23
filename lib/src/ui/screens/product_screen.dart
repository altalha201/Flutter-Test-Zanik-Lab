import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/models/product_model.dart';
import '../components/image_carousel_slider.dart';
import '../components/product_bottom_bar.dart';
import '../components/product_info_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.item,
    required this.discountedPrice,
  }) : super(key: key);

  final ProductModel item;
  final double discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constants.primaryOrange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          ImageCarouselSlider(images: item.images ?? []),
          ProductInfoCard(item: item, discountedPrice: discountedPrice),
          const SizedBox(height: 8.0),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(item.description ?? ""),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const ProductBottomBar(),
    );
  }
}