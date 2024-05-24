import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemJajanVertical extends StatelessWidget {
  const ItemJajanVertical({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.isHalal,
  });

  final String image, name;
  final double rating;
  final bool isHalal;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: height * 0.15,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fitWidth),
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        Container(
          height: height * 0.15,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: tsBodySmall.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                    ),

                    Container(
                      height: 25,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Row(
                          children: [

                            SvgPicture.asset(icStar),

                            const SizedBox(width: 5,),

                            Text(rating.toString(), style: tsBodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                isHalal ? Image.asset(icHalal) : Container()

              ],
            )
        ),
      ],
    );
  }
}
