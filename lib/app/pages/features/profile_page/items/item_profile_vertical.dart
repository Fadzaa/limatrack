import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemProfileVertical extends StatelessWidget {
  const ItemProfileVertical({
    super.key,
    required this.color,
    required this.icon,
    required this.name,
    required this.routes,
    required this.isDarkMode
  });

  final Color color;
  final String icon, name, routes;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: SvgPicture.asset(icon, width: 20, height: 20)
            ),
          ),

          const SizedBox(width: 20,),

          Text(name, style: tsBodyMedium.copyWith(
            color: blackColor,
            fontWeight: FontWeight.w600
          ),),

          const Spacer(),

          isDarkMode
              ? Switch(
              value: false,
              onChanged: (value) {}
          )
              : InkWell(
            onTap: () => Get.toNamed(routes),
            child: const Icon(Icons.arrow_forward_ios)
          )
        ],
      )
    );
  }
}
