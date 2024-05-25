import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    super.key,
    required this.imageUrl,
    required this.warungName
  });

  final String imageUrl, warungName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50,),

            SvgPicture.asset(bottomMarker, width: 30),

            const SizedBox(height: 10),

            Text(warungName, style: tsBodySmall)
          ],
        ),


        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor
          ),

          child: Container(
            width: 45,
            height: 45,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover
              ),
              shape: BoxShape.circle,
              color: Colors.black
            ),
          ),
        ),


      ],
    );
  }
}
