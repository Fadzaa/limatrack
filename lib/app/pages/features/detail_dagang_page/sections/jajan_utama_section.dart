import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/items/item_jajan_grid.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/common/theme.dart';

class JajanUtamaSection extends GetView<DetailPageController> {
  const JajanUtamaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jajanan Utama", style: tsBodyLarge.copyWith(
            fontWeight: FontWeight.w600
        ),),

        Text("Rekomendasi Dari Pedagang nih...", style: tsLabelMedium.copyWith(
            fontWeight: FontWeight.w600
        ),),

        const SizedBox(height: 15,),

        GridView.builder(
            shrinkWrap: true,
            itemCount: controller.jajanan_utama.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.87
            ),
            itemBuilder: (context, index) {
              final jajan_data = controller.jajanan_utama[index];

              return InkWell(
                onTap: () {
                  detailJajanBottomSheet(
                      image: jajan_data.image,
                      warungName: controller.warungModel.namaWarung,
                      jajananName: jajan_data.nama,
                      description: jajan_data.deskripsi
                  );
                },
                child: ItemJajanGrid(
                  image: jajan_data.image,
                  name: jajan_data.nama,
                  description: jajan_data.deskripsi,
                  price: jajan_data.harga,
                  stockEmpty: jajan_data.tersedia,
                  jajan: jajan_data,
                ),
              );
            }


        ),
      ],
    );
  }
}