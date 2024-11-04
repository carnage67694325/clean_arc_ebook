import 'package:flutter/material.dart';

class CustomBookItemFadingAnimation extends StatelessWidget {
  const CustomBookItemFadingAnimation({super.key});

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const SizedBox(),
      ),
    );
  }
}
