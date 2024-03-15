import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/items/item_explore_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/item_jajan_vertical.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'explore_page_controller.dart';

class ExplorePageView extends GetView<ExplorePageController> {
  const ExplorePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Mau Jajan Apa\n",
                      style: tsTitleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor
                      ),
                      children: [
                        TextSpan(
                          text: "Hari Ini?",
                          style: tsTitleMedium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primaryColor
                          ),
                        )
                      ]
                    ),
                  ),

                  const SizedBox(height: 15,),

                  SizedBox(
                    height: 40,
                    child: TextField(
                      style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: blackColor
                      ),
                        decoration: InputDecoration(
                          contentPadding:  EdgeInsets.only(left: 20),
                            hintText: "Cari Jajanan...",
                            hintStyle: tsBodySmall.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF808383)
                          ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                          ),
                            filled: true,
                            fillColor: const Color(0xFF707070).withOpacity(0.1)
                      ),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  SvgPicture.asset(icExplore),
                  const SizedBox(width: 10,),

                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.list_filter.length,
                          itemBuilder: (context, index) =>
                              Obx(() => FilterButton(
                                name: controller.list_filter[index],
                                isSelected: controller.currentIndex.value == index,
                                index: index,
                              ))
                              
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 4,
                      itemBuilder: (context, index) =>
                          InkWell(
                            onTap: () => detailJajanBottomSheet(),
                            child: ItemExploreVertical(
                              image: exampleJajanRectangle,
                              name: "Telur Gulung",
                              description: "Telur Digulung",
                              price: 10000,
                            ),
                          )
                  ),
                ),
              ),
            )


          ],
        ),
      )
    );
  }
}

class FilterButton extends GetView<ExplorePageController> {
  const FilterButton({
    super.key,
    required this.name,
    required this.isSelected,
    required this.index

  });

  final String name;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.changeIndex(index),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? primaryColor : Colors.white,
          border: isSelected ? null : Border.all(color: primaryColor),
        ),
        child: Center(
          child: Text(name, style: tsBodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : primaryColor
          ),),
        ),
      ),
    );
  }
}









