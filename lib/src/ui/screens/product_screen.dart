import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../data/models/product_model.dart';

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
      body: Column(
        children: [
          Image.network(item.thumbnail ?? Constants.imagePlaceholder),
        ],
      ),
    );
  }
}
