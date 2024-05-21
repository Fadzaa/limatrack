import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemLanggananVertical extends StatelessWidget {
  const ItemLanggananVertical({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  final String image;
  final String title;
  final String subtitle;
  final double rating;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 95,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                        style: tsBodySmall.copyWith(
                          fontWeight: FontWeight.w600
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        subtitle,
                        style: tsLabelLarge
                      ),

                      const SizedBox(height: 5),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.white, size: 16),
                            Text(
                              rating.toString(),
                              style: tsBodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                              )
                              ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const Spacer(),

                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert)
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
