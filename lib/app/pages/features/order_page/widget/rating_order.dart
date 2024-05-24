import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/order_page_controller.dart';

class RatingOrder extends GetView<OrderPageController> {
  const RatingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 35,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        controller.isRating.value = true;
      },
    );
  }
}
