import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_controller.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/item_jajan_horizontal.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/section_text.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_warning_box.dart';
import 'package:limatrack_genetic/app/pages/global_component/loading_overlay.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationSection extends GetView<HomePageController> {
  const RecommendationSection({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SectionText(
                  heading: "Rekomendasi",
                  subHeading: "Cobain Jajanan Rekomendasi  Kami",
                  navigatedTo: Routes.HOME_PAGE
              ),

              SizedBox(height: 20),

              CommonWarningBox(text: "Produk tanpa logo halal belum tentu haram, \nnamun belum terverifikasi."),

              SizedBox(height: 20),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.width * 0.42,
          child: Obx(
                () => ShimmerOverlay(
                    isLoading: controller.isLoading.value,
                    axis: Axis.horizontal,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listWarung.length,
                      itemBuilder: (context, index) {
                        final listWarung = controller.listWarung[index];

                        return ItemJajanHorizontal(
                          image: listWarung.banner,
                          name: listWarung.namaWarung,
                          rating: listWarung.averageRating,
                          isHalal: listWarung.sertifikasiHalal,
                        );
                      },
                    ),
                )
          )
        )
      ]
    );
  }
}