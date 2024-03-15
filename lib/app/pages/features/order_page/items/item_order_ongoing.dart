import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limatrack_genetic/common/constant.dart';

import '../../../../../common/theme.dart';

class ItemOrderOngoing extends StatelessWidget {
  const ItemOrderOngoing({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.isReady
  });

  final String image, name, description;
  final int price;
  final bool isReady;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, fit: BoxFit.cover, height: double.maxFinite, width: 80, )
          ),

          const SizedBox(width: 10,),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(name, style: tsBodyMedium.copyWith(
                        fontWeight: FontWeight.w600
                    ),),

                    const SizedBox(height: 5,),

                    Text(isReady ? "Sudah Jadi" : "Belum Jadi", style: tsLabelLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isReady ? Colors.green :  greyColor
                    ),),

                    const SizedBox(height: 15,),

                    Text(description, style: tsLabelLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: greyColor
                    ),),


                  ],
                ),

                Row(
                  children: [
                    Text("Rp. " + price.toString(), style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: greyColor
                    ),),
                  ],
                )



              ],
            ),
          )
        ],
      ),
    );
  }
}
