import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/counter_jajan.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemJajanGrid extends GetView<DetailPageController> {
  const ItemJajanGrid({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.stockEmpty,
    required this.jajan
  });

  final String image, name, description;
  final int price;
  final bool stockEmpty;
  final JajananModel jajan;



  @override
  Widget build(BuildContext context) {
    RxInt counter = 0.obs;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              !stockEmpty ? Container(
                foregroundDecoration: const BoxDecoration(
                  color: Color(0xFFBABABA),
                  backgroundBlendMode: BlendMode.saturation,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(image, fit: BoxFit.fitWidth, width: double.maxFinite, height: 100, )
                ),
              ) : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(image, fit: BoxFit.fitWidth, width: double.maxFinite, height: 100, )
              ),

              Container(
                width: 90,
                height: 30,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                    color: !stockEmpty ? const Color(0xFFBABABA) : secondaryColor
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(icPriceTag),

                    const SizedBox(width: 5,),

                    Text(!stockEmpty ? "Habis" : "Rp" "$price", style: tsLabelLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                ),

              )
            ],
          ),


          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: tsBodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),),


                    Text(description,
                      style: tsLabelLarge.copyWith(
                        color: greyColor,
                        fontWeight: FontWeight.w500,
                      ),

                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),

                const SizedBox(height: 15,),


                Obx(() =>
                counter.value > 0
                    ? CounterJajan(counter: counter, isGrid: true, price: price.obs, jajan: jajan,)
                    : CommonButton(text: "Tambah", onPressed: () => controller.addDataJajan(counter, jajan), height: 34,)
                ),
              ],
            ),
          )


        ],
      )
    );
  }
}
