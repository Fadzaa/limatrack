import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';

import '../../../../../common/theme.dart';

class CounterJajan extends GetView<DetailPageController> {
  const CounterJajan({
    super.key,
    required this.counter,
    required this.price,
    required this.isGrid
  });

  final RxInt counter, price;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        InkWell(
          onTap: () => controller.decrementCounter(counter, price),
          child: Obx(() => Container(
              height: isGrid ? 35 : 20,
              width: isGrid ? 35 : 20,
              decoration: BoxDecoration(
                  color:  counter.value == 1 ?  greyColor.withOpacity(0.2) : primaryColor,
                  borderRadius: isGrid ? BorderRadius.circular(10) : BorderRadius.circular(5)
              ),
              child: Icon(
                  Icons.remove,
                  color: controller.total.value == 1 ? greyColor : Colors.white,
                  size: isGrid ? 15 : 10
              )
          ),)
        ),

        Obx(() => Text("$counter", style: tsLabelLarge.copyWith(
          fontWeight: FontWeight.w600
        ),)),

        InkWell(
            onTap: () => controller.incrementCounter(counter, price),
            child: Container(
                height: isGrid ? 35 : 20,
                width: isGrid ? 35 : 20,
                decoration: BoxDecoration(
                    color:  primaryColor,
                    borderRadius: isGrid ? BorderRadius.circular(10) : BorderRadius.circular(5)
                ),
                child: Icon(Icons.add, color: Colors.white, size: isGrid ? 15 : 10,)
            ),
        ),
      ],
    );
  }
}


