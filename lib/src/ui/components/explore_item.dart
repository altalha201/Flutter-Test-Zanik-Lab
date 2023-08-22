import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ExploreItem extends StatelessWidget {
  final String? imgUrl;
  final VoidCallback? onTap;

  const ExploreItem({
    super.key,
    this.imgUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Constants.colorGray,
          image: DecorationImage(
              image: NetworkImage(
                imgUrl ?? Constants.imagePlaceholder,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
