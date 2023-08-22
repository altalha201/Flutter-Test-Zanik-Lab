import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomSearchAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double height;

  const CustomSearchAppbar({
    super.key, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0),),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              elevation: const MaterialStatePropertyAll(0),
              backgroundColor: const MaterialStatePropertyAll(
                Constants.colorGray,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              leading: const Icon(Icons.search),
              hintText: "Search in Swipexyz..",
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}