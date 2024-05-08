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
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(image, width: 85, fit: BoxFit.cover),

          const SizedBox(width: 10),

          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Column(
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

                IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.more_vert)
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
