import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../data/models/product_model.dart';
import '../screens/product_screen.dart';

class ProductDialog extends StatelessWidget {

  final ProductModel item;

  const ProductDialog({
    super.key, required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var price = item.price! - (item.price! * (item.discountPercentage! / 100.0) );
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.orange,
              image: DecorationImage(
                image: NetworkImage(
                  item.thumbnail ?? Constants.imagePlaceholder,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4.0),
                Text(
                  "Price: BDT ${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
      titlePadding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      contentPadding: const EdgeInsets.all(12.0),
      content: SizedBox(
        height: 342,
        child: Column(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(
                    item.images?[0] ?? Constants.imagePlaceholder,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.to(ProductScreen(item: item, discountedPrice: price));
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Constants.primaryOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),
                child: const Text("View Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
