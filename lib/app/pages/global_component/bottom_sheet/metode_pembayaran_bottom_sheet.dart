import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/items/item_pembayaran_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/model/pembayaran_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_warning_box.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

void metodePembayaranBottomSheet (CartPageController controller) {

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

            Text("Pilih Metode Pembayaran", style: tsBodyLarge.copyWith(
                fontWeight: FontWeight.w600
            )),

            const SizedBox(height: 20,),

            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pembayaran_data.length,
                itemBuilder: (context, index) =>
                    Obx(() => ItemPembayaranVertical(
                      image: pembayaran_data[index].image,
                      name: pembayaran_data[index].name,
                      isSelected: index == controller.selectedIndex.value ? true : false,
                      index: index,
                    ))
            ),

            const Spacer(),

            CommonButton(text: "Simpan Metode", onPressed: () {}, height: 45,)


          ],
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.2),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true
  );
}