import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/string_extensions.dart';
import '../../data/models/product_model.dart';
import 'conditional_badges.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({
    super.key,
    required this.item,
    required this.discountedPrice,
  });

  final ProductModel item;
  final double discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Text(
                "৳ ${(item.discountPercentage ?? 0.0) > 0.0 ? discountedPrice.toStringAsFixed(2) : item.price}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Visibility(
                visible: (item.discountPercentage ?? 0.0) > 0.0,
                replacement: const SizedBox.shrink(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "৳ ${item.price}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              ConditionalBadges(
                title: "Stock Limited",
                condition:
                (item.stock ?? 0) < 12 && (item.stock ?? 0) > 0,
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              ConditionalBadges(
                title: "Out of stock",
                condition: (item.stock ?? 0) == 0,
                backgroundColor: Constants.colorGray,
                foregroundColor: const Color(0xFF6B6B6B),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Divider(),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.yellow.shade700,
              ),
              const SizedBox(width: 4.0),
              Text(
                "${(item.rating ?? 0.0).toStringAsFixed(2)} / 5.00",
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              ConditionalBadges(
                title: "Top Rated",
                condition: (item.rating ?? 0.00) >= 4.7,
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            "Brand : ${item.brand?.toTitleCase()}",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            "Category : ${item.category?.toTitleCase()}",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}