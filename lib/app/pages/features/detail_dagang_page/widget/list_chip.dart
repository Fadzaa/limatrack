import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';

class ListChip extends StatelessWidget {
  const ListChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChipLabel(icon: icStarSecondary, iconText: "5.0", label: "Rating"),

        Container(
          width: 1,
          height: 30,
          decoration: BoxDecoration(
              color: greyColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)
          ),
        ),

        ChipLabel(icon: icLocationSecondary, iconText: "0.52 km", label: "Jarak Pedagang"),

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
