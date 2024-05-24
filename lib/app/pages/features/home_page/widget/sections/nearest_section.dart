import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/item_jajan_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/section_text.dart';
import 'package:limatrack_genetic/app/pages/global_component/loading_overlay.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';



class NearestSection extends GetView<HomePageController> {
  const NearestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionText(
              heading: "Terdekat Kamu",
              subHeading: "Jajanan Terdekat Dari Lokasimu",
              navigatedTo: Routes.HOME_PAGE
          ),

          const SizedBox(height: 20,),

          Obx(() => ShimmerOverlay(
            isLoading: controller.isLoading.value,
            axis: Axis.vertical,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.listWarungTerdekat.length,
                itemBuilder: (context, index) {
                  final listWarungTerdekat = controller.listWarungTerdekat[index];

                  return ItemJajanVertical(
                      image: listWarungTerdekat.banner,
                      name: listWarungTerdekat.namaWarung,
                      rating: listWarungTerdekat.averageRating,
                      isHalal: listWarungTerdekat.sertifikasiHalal
                  );
                }

            ),
          ))
        ],
      ),
    );
  }
}