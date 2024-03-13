import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';

import '../../../../../../common/theme.dart';
import '../../../../global_component/common_button.dart';

class SectionText extends StatelessWidget {
  const SectionText({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.navigatedTo,
  });

  final String heading, subHeading, navigatedTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading, style: tsBodyLarge.copyWith(fontWeight: FontWeight.w600),),
            Text(subHeading, style: tsLabelMedium.copyWith(fontWeight: FontWeight.w500),),
          ],
        ),

        ElevatedButton(
            onPressed: () => Get.toNamed(navigatedTo),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              )
            ),
            child: Text("Lihat Semua", style: tsLabelLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),)
        ),


      ],
    );
  }
}
