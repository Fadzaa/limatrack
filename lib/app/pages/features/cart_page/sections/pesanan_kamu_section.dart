import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/items/item_cart_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/catatan_bottom_sheet.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class PesananKamuSection extends GetView<CartPageController> {
  const PesananKamuSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Jajan> arguments = Get.arguments;



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pesanan Kamu", style: tsBodyLarge.copyWith(
          fontWeight: FontWeight.w600
        )),

        ListView.builder(
            itemCount: arguments.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                ItemCartVertical(
                image: exampleJajanRectangle,
                name: arguments[index].name,
                price: 1000.obs,
                counter: 3.obs,
                jajan: jajan_data[index],
            )
        ),

        const SizedBox(height: 25,),

        ElevatedButton(
            onPressed: () => catatanBottomSheet(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.5, 30),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            child: Row(
              children: [
                SvgPicture.asset(icNote),
                
                const SizedBox(width: 10,),
                
                Text("Tambah Catatan", style: tsBodySmall.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w600
                ),)
              ],
            )
        ),

        const SizedBox(height: 25,),

        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mau Tambah \nJajanan?", style: tsBodyLarge.copyWith(
                    fontWeight: FontWeight.bold
                  )),

                  const SizedBox(height: 5,),

                  Text("Jika Kamu Mau...", style: tsLabelMedium.copyWith(
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),

              CommonButton(text: "Tambah Lagi", onPressed: (){}, width: 140, height: 30, style: tsBodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),)

            ],
          ),
        )
      ],
    );
  }
}
