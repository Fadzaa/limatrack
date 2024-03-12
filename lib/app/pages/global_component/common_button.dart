import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class CommonButton extends StatelessWidget {
   CommonButton({
    super.key,
     required this.text,
     required this.onPressed,
     this.style
   });

    String text;
    VoidCallback onPressed;
    TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
        ),

        child: Text(
          text,
          style: style ?? tsBodyMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )

    );
  }
}

class CommonButtonGoogle extends StatelessWidget {
  const CommonButtonGoogle({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          elevation: 2
        ),


        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Masuk dengan Google",
              style: tsBodySmall
            ),

            const SizedBox(width: 10,),

            SvgPicture.asset(icGoogle, width: 20, height: 20,),

          ],
        )

    );
  }
}
