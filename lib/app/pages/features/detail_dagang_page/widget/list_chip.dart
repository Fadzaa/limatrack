import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';
import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';

class ListChip extends GetView<DetailPageController> {
  const ListChip({super.key});

  @override
  Widget build(BuildContext context) {
    String jarak = controller.warungModel.jarak;

    String jarakFormat = jarak.length > 4 ? jarak.substring(0, 4) : jarak;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChipLabel(icon: icStarSecondary, iconText: controller.warungModel.averageRating.toString(), label: "Rating"),

        Container(
          width: 1,
          height: 30,
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)
          ),
        ),

        ChipLabel(icon: icLocationSecondary, iconText: jarakFormat + "km", label: "Jarak Pedagang"),

        Container(
          width: 1,
          height: 30,
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)
          ),
        ),

        ChipLabel(icon: icPriceTagSecondary, iconText: "Dibawah 5k", label: "Harga Jajanan")

      ],
    );
  }
}

class ChipLabel extends StatelessWidget {
  const ChipLabel({
    super.key,
    required this.icon,
    required this.iconText,
    required this.label,

  });

  final String icon, iconText, label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Row(
              children: [
                SvgPicture.asset(icon),

                const SizedBox(width: 5,),

                Text(iconText,
                    style: tsBodySmall.copyWith(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600
                    )
                ),


              ],
            ),
          ),
        ),

        const SizedBox(height: 5,),

        Text(label, style: tsLabelLarge.copyWith(
            color: const Color(0xFF707070),
            fontWeight: FontWeight.w500
        ),)

      ],
    );
  }
}
