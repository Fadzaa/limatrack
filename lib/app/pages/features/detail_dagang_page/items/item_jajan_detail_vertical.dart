import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/counter_jajan.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemJajanDetailVertical extends GetView<DetailPageController> {
  const ItemJajanDetailVertical({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.stockEmpty
  });

  final String image, name, description;
  final int price;
  final bool stockEmpty;

  @override
  Widget build(BuildContext context) {
    RxInt counter = 0.obs;

    return Stack(
      children: [
        Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              stockEmpty ? Container(
                foregroundDecoration: const BoxDecoration(
                  color: Color(0xFFBABABA),
                  backgroundBlendMode: BlendMode.saturation,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(image, fit: BoxFit.fitWidth, width: 100, height: 100, )
                ),
              ) : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image, fit: BoxFit.fitWidth, width: 100, height: 100, )
              ),
              

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(name, style: tsBodySmall.copyWith(
                            fontWeight: FontWeight.w600
                        ),),

                        const SizedBox(height: 5,),

                        Text(description, style: tsLabelLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBABABA)
                        ),),

                        const SizedBox(height: 5,),

                        Row(
                          children: [
                            SvgPicture.asset(icPriceTagSecondary, color: stockEmpty ? const Color(0xFFBABABA) : secondaryColor),

                            const SizedBox(width: 5,),

                            Text(stockEmpty ? "Habis" : "Rp. " + price.toString(), style: tsBodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: stockEmpty ? const Color(0xFFBABABA) : secondaryColor
                            ),),
                          ],
                        )
                      ],
                    ),



                  ],
                ),
              )
            ],
          ),
        ),

        Obx(() => Positioned(
          bottom: 25,
          right: 15,
          child: counter.value  > 0
              ? SizedBox(
              width: 75,
              child: CounterJajan(counter: counter, isGrid: false, price: price.obs))

              : ElevatedButton(
              onPressed: stockEmpty ? null : () => controller.initialAddCounter(counter, price.obs),
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              child: Text("Tambah", style: tsLabelLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ))
          ),

        ))

      ],
    );
  }
}
