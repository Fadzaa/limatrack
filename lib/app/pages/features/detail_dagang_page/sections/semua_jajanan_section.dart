import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/detail_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/items/item_jajan_detail_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/common/theme.dart';

class SemuaJajananSection extends GetView<DetailPageController> {
  const SemuaJajananSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Semua Jajanan", style: tsBodyLarge.copyWith(
            fontWeight: FontWeight.w600
        ),),

        const SizedBox(height: 10,),

        ListView.builder(
            itemCount: controller.semua_jajanan.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final jajan_data = controller.semua_jajanan[index];

              return InkWell(
                onTap: () {
                  detailJajanBottomSheet(
                      image: jajan_data.image,
                      warungName: controller.warungModel.namaWarung,
                      jajananName: jajan_data.nama,
                      description: jajan_data.deskripsi
                  );
                },
                child: ItemJajanDetailVertical(
                  image: jajan_data.image,
                  name: jajan_data.nama,
                  description: jajan_data.deskripsi,
                  price: jajan_data.harga,
                  stockEmpty: jajan_data.tersedia,
                  jajan: jajan_data,
                ),
              );
            }

        )
      ],
    );
  }
}