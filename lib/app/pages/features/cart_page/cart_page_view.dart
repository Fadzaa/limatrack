import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/model/pembayaran_data.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/metode_pembayaran_section.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/pesanan_kamu_section.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/rincian_pembayaran_section.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/floating_bottom_cart.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/theme.dart';
import '../../../../common/constant.dart';


class CartPageView extends GetView<CartPageController> {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
                child: SvgPicture.asset(icArrowLeft)
            ),
            
            const Spacer(),
            
            Text("Waroeng Obenk", style: tsBodyLarge.copyWith(
              fontWeight: FontWeight.w600
            ),),

            const Spacer(),
            ],
        ),
        backgroundColor: baseColor,
        foregroundColor: baseColor,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MessageNote(),

                    SizedBox(height: 20,),

                    PesananKamuSection(),

                    SizedBox(height: 20,),

                    RincianPembayaranSection(),

                    SizedBox(height: 20,),

                    MetodePembayaranSection(),

                    SizedBox(height: 125,)
                  ],
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            height: 125,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Row(
                  children: [
                    Image.asset(pembayaran_data[controller.selectedIndex.value].image),

                    const SizedBox(width: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pembayaran_data[controller.selectedIndex.value].name, style: tsLabelLarge.copyWith(
                            fontWeight: FontWeight.w600
                        ),),

                        Text("${controller.totalPrice.value}", style: tsLabelLarge),

                      ],
                    ),

                  ],
                ),),

                const Spacer(),

                CommonButton(text: "Pesan Sekarang", onPressed: () => Get.toNamed(Routes.DETAIL_PAYMENT_PAGE), height: 50, borderRadius: 32,)
              ],
            ),
          )
        ],
      ),


    );
  }
}

class MessageNote extends StatelessWidget {
  const MessageNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 125,
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pesan dan Ambil", style: tsBodyMedium.copyWith(
                      fontWeight: FontWeight.bold
                    )),

                    const SizedBox(height: 5,),

                    Flexible(
                      child: Text("Aplikasi ini menyediakan fitur pickup, jadi kalian pesan, bayar, dan langsung ambil saja",
                          style: tsBodySmall
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),

        Positioned(
            bottom: 2,
            right: 2,
            child: SvgPicture.asset(noteVector)
        )
      ],
    );
  }
}











