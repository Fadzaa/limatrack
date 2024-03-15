import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/cart_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/metode_pembayaran_section.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/pesanan_kamu_section.dart';
import 'package:limatrack_genetic/app/pages/features/cart_page/sections/rincian_pembayaran_section.dart';
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
              onTap: () => Get.toNamed(Routes.DETAIL_DAGANG_PAGE),
                child: SvgPicture.asset(icArrowLeft)
            ),
            
            const Spacer(),
            
            Text("Waroeng Obenk", style: tsBodyLarge.copyWith(
              fontWeight: FontWeight.w600
            ),),

            const Spacer(),
            ],
        )
      ),
      body: const SafeArea(
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
              ],
            ),
          ),
        ),
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











