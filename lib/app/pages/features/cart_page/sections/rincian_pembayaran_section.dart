import 'package:flutter/material.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_warning_box.dart';
import 'package:limatrack_genetic/common/theme.dart';

class RincianPembayaranSection extends StatelessWidget {
  const RincianPembayaranSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rincian Pembayaran", style: tsBodyLarge.copyWith(fontWeight: FontWeight.w600),),

        const SizedBox(height: 10,),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Harga Jajanan", style: tsBodySmall.copyWith(fontWeight: FontWeight.w500),),
                  Text("Rp 3.000", style: tsBodySmall.copyWith(fontWeight: FontWeight.w600),),
                ],
              ),

              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Biaya Admin", style: tsBodySmall.copyWith(fontWeight: FontWeight.w500),),
                  Text("Rp 500", style: tsBodySmall.copyWith(fontWeight: FontWeight.w600),),
                ],
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(height: 1, color: Colors.grey[200],)
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: tsBodyLarge.copyWith(fontWeight: FontWeight.bold),),
                  Text("Rp 3.500", style: tsBodyLarge.copyWith(fontWeight: FontWeight.w600),),
                ],
              ),



            ],
          ),
        ),

        const SizedBox(height: 20,),

        const CommonWarningBox(text: "Biaya Admin Dikenakan Sebesar 0.5% dari Total \nPembelanjaan")
      ],
    );
  }
}
