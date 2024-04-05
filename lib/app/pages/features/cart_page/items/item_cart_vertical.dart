import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/counter_jajan.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class ItemCartVertical extends StatelessWidget {
  const ItemCartVertical({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.counter,
    required this.jajan
  });

  final String image, name;
  final RxInt price, counter;
  final JajananModel jajan;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Row(
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(16),
               child: Image.asset(image, height: double.maxFinite, width: 100, fit: BoxFit.cover,),
             ),

             const SizedBox(width: 20,),

             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(name, style: tsBodyMedium.copyWith(
                     fontWeight: FontWeight.w600
                 ),),

                 Row(
                   children: [
                     SvgPicture.asset(icPriceTagSecondary),

                     const SizedBox(width: 5,),

                     Text("Rp. $price", style: tsBodySmall.copyWith(
                         color: const Color(0xFF707070).withOpacity(0.6),
                         fontWeight: FontWeight.w600
                     ),),

                   ],
                 )
               ],
             ),
           ],
         ),


         SizedBox(
           width: 70,
           child: CounterJajan(counter: counter, price: price, isGrid: false, jajan: jajan),
         )
        ],
      ),
    );
  }
}
