import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/metode_pembayaran_bottom_sheet.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class MetodePembayaranSection extends GetView<CartPageController> {
  const MetodePembayaranSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Metode Pembayaran", style: tsBodyLarge.copyWith(fontWeight: FontWeight.bold),),

        const SizedBox(height: 20,),

        InkWell(
          onTap: () => metodePembayaranBottomSheet(controller),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(icCashPayment),

                    const SizedBox(width: 5,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bayar di Tempat", style: tsBodySmall.copyWith(fontWeight: FontWeight.w600),),
                        Text("Rp 3.500", style: tsBodySmall),
                      ],
                    ),
                  ],
                ),

                Transform.rotate(angle: -110, child: SvgPicture.asset(icArrowLeft),)


              ]
            ),
          ),
        )


      ],
    );
  }
}
