import 'package:clean_arc_bookly/Features/home/presentation/views/widgets/custom_book_item_fading_animation.dart';
import 'package:clean_arc_bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedListFadingAntimation extends StatelessWidget {
  const FeaturedListFadingAntimation({super.key});

  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookItemFadingAnimation(),
            );
          },
        ),
      ),
    );
  }
}
