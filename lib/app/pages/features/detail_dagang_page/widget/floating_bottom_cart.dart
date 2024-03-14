import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/common/constant.dart';

import '../../../../../common/theme.dart';
import '../detail_page_controller.dart';

class FloatingBottomCart extends GetView<DetailPageController> {
  const FloatingBottomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() =>  Text("${controller.total.value} Item", style: tsBodySmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),),

              Text("Warung Obenk", style: tsLabelLarge.copyWith(
                color: Colors.white,
              ),)
            ],
          ),

          Row(
            children: [
              Obx(() => Text(controller.totalPrice.value.toString(), style: tsBodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),),
              ),

              const SizedBox(width: 5,),

              SvgPicture.asset(icCartFill),
            ],
          )

        ],
      ),
    );
  }
}