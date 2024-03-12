import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/model/onboard_data.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/widget/dot_indicator.dart';
import 'package:limatrack_genetic/app/pages/initial_pages/onboarding_page/widget/onboard_content.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

import 'onboarding_page_controller.dart';

class OnboardingPageView extends GetView<OnboardingPageController> {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(logoSecondary),
                        TextButton(
                            onPressed: () => controller.skipOnboarding(),
                            child: Text("Skip", style: tsTitleSmall.copyWith(color: blackColor),)
                        )
                      ],
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: onboard_data.length,
                          onPageChanged: (index) {
                            controller.onPageChanged(index);
                          },
                          itemBuilder: (context, index) => OnboardContent(
                            image: onboard_data[index].image,
                            text: onboard_data[index].text,
                          ),
                        ),
                      )
                    ),

                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        ...List.generate(onboard_data.length, (index) =>
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

                    ElevatedButton(
                        onPressed: () => controller.onPressedButton(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),

                        child: Obx(() =>
                            Text(
                              controller.pageIndex.value == 2 ? "Mulai Sekarang" : "Lanjut",
                              style: tsTitleSmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                        )

                    ),

                    const SizedBox(height: 20,)
                  ],
                )
            )
        )
    );
  }
}
