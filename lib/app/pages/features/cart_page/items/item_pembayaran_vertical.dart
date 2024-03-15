import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemPembayaranVertical extends GetView<CartPageController> {
  const ItemPembayaranVertical({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
    required this.index,
  });

  final String image, name;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.changeIndex(index) ,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF707070).withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(image),

                const SizedBox(width: 10,),

                Text(name, style: tsBodyMedium.copyWith(fontWeight: FontWeight.w600),),
              ],
            ),

            Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                    color: const Color(0xFF707070).withOpacity(0.4),
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.transparent,
                        shape: BoxShape.circle
                    ),
                  ),
                )
            ),

          ],
        ),
      )
    );
  }
}
