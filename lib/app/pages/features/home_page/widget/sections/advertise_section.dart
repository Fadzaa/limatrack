import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/home_page_controller.dart';

import '../../../../../../common/constant.dart';
import '../../../../initial_pages/onboarding_page/widget/dot_indicator.dart';
import '../../model/jajan_data.dart';

class AdvertiseSection extends GetView<HomePageController> {
  const AdvertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView.builder(
                controller: controller.pageController,
                itemCount: jajan_data.length,
                onPageChanged: (index) {
                  controller.onPageChanged(index);
                },
                itemBuilder: (context, index) =>
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(exampleAds),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
            ),
          ),

          const SizedBox(height: 20,),

          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ...List.generate(jajan_data.length, (index) =>
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: DotIndicator(
                      isActive: index == controller.pageIndex.value,
                    ),
                  ),
              ),

            ],
          ),
          ),
        ],
      ),
    );
  }
}