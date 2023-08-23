import 'package:flutter/material.dart';

class ConditionalBadges extends StatelessWidget {
  const ConditionalBadges({
    super.key,
    required this.title,
    required this.condition,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize,
  });

  final String title;
  final bool condition;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: condition,
      replacement: const SizedBox.shrink(),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 2.0,
        ),
        margin: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              color: foregroundColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
