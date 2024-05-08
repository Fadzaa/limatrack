import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/langganan_page/items/item_langganan_vertical.dart';
import 'package:limatrack_genetic/app/pages/global_component/loading_overlay.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'langganan_page_controller.dart';

class LanggananPageView extends GetView<LanggananPageController> {
  const LanggananPageView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            ),

            Text(
              'Langgananmu',
              style: tsBodyLarge,
            ),

            const SizedBox()
          ],
        ),
      ),

      body: SafeArea(
        child: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) =>
                            const ItemLanggananVertical(
                                image: "https://via.placeholder.com/150",
                                title: "Ahmad Soebarjo",
                                subtitle: "Sekitar 0.2 km dari lokasimu",
                                rating: 5.0
                            )
                    )
                  ],
                ),
              ),
            ),
        ))
      )
    );
  }
}
