import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limatrack_genetic/common/constant.dart';

import '../../../../../common/theme.dart';

class ItemExploreVertical extends StatelessWidget {
  const ItemExploreVertical({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  final String image, name, description;
  final int price;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image, fit: BoxFit.cover, width: 100, height: 100, )
          ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(name, style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w600
                    ),),

                    const SizedBox(height: 5,),

                    Text(description, style: tsLabelLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFBABABA)
                    ),),

                    const SizedBox(height: 5,),

                    Row(
                      children: [
                        SvgPicture.asset(icPriceTagSecondary),

                        const SizedBox(width: 5,),

                        Text("Rp. " + price.toString(), style: tsBodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: secondaryColor
                        ),),
                      ],
                    )
                  ],
                ),



              ],
            ),
          )
        ],
      ),
    );
  }
}
