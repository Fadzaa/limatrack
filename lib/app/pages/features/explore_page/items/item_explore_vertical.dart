import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limatrack_genetic/common/constant.dart';

import '../../../../../common/theme.dart';

class ItemExploreVertical extends StatelessWidget {
  const ItemExploreVertical({
    super.key,
    required this.image,
    required this.name,
    required this.distance,
    required this.rating,
  });

  final String image, name, distance;
  final double rating;


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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w600
                    ),),

                    const SizedBox(height: 5,),

                    Text('sekitar $distance dari lokasimu', style: tsLabelLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: blackColor
                    ),),

                    const SizedBox(height: 5,),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Row(
                              children: [

                                SvgPicture.asset(icStar),

                                const SizedBox(width: 5,),

                                Text(rating.toString(),
                                  style: tsBodySmall.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
