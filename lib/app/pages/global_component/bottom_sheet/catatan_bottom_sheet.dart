import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_warning_box.dart';
import 'package:limatrack_genetic/common/theme.dart';

void catatanBottomSheet () {
  Get.bottomSheet(
      Container(
        height: 500,
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

            const SizedBox(height: 15,),

            Text("Tambahkan Catatan", style: tsBodyLarge.copyWith(
                fontWeight: FontWeight.w600
            )),

            const SizedBox(height: 20,),
            
            const CommonWarningBox(text: "Catatan Ini Akan Disampaikan Pada Pedagang"),

            Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.grey[200], thickness: 1,)
            ),

            TextField(
              maxLength: 200,
              style: tsBodySmall,
              decoration: InputDecoration(
                fillColor: const Color(0xFF707070).withOpacity(0.1),
                filled: true,
                hintText: "Contoh : Tambah Saos Pedas ya..",
                hintStyle: tsBodySmall.copyWith(
                    color: greyColor
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                )
              ),
            ),

            const Spacer(),

            CommonButton(text: "Simpan Catatan", onPressed: () {}, height: 45,)


          ],
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true
  );
}