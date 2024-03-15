import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

void detailJajanBottomSheet () {
  Get.bottomSheet(
      Container(
        height: 550,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(width: 50, height: 3, color: Colors.grey[200])
            ),

            const SizedBox(height: 10,),

            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  exampleJajanRectangle,
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                  height: 300,)
            ),

            SizedBox(height: 20,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icCartSecondary),

                const SizedBox(width: 5,),

                Text("Waroenk Obenk",
                  style: tsBodyMedium.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),

            const SizedBox(height: 20,),

            Text("Daging Kukus", style: tsBodyLarge.copyWith(
                fontWeight: FontWeight.w600
            ),),

            Text("Steak Daging dengan Sentuhan Tangan", style: tsBodySmall),

            const SizedBox(height: 10,),

            const Spacer(),

            CommonButton(text: "Tambah Ke Keranjang", onPressed: () {}, height: 40,)


          ],
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true
  );
}