import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/items/item_explore_vertical.dart';
import 'package:limatrack_genetic/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'explore_page_controller.dart';

class ExplorePageView extends GetView<ExplorePageController> {
  const ExplorePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

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
                        onSubmitted: (value) => controller.fetchPedagangSearch(value),
                        style: tsBodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: blackColor
                        ),
                        decoration: InputDecoration(
                            contentPadding:  const EdgeInsets.only(left: 20),
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
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        child: controller.listWarungTerdekat.isNotEmpty
                            ? ListView.builder(
                          itemCount: controller.listWarungTerdekat.length,
                          itemBuilder: (context, index) {
                            WarungModel warung = controller.listWarungTerdekat[index];

                            return InkWell(
                              // onTap: () => detailJajanBottomSheet(),
                              child: ItemExploreVertical(
                                image: warung.banner,
                                name: warung.namaWarung,
                                distance: warung.jarak,
                                rating: warung.averageRating,
                              ),
                            );
                          },
                        )
                            : NotFoundPage(
                          image: notFoundExplore,
                          title: "Kami Tidak Menemukannya",
                          subtitle: "Perbaiki Kata Kunci atau Cari Makanan Lainnya",
                        ),
                      );
                    }
                  }),
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
      onTap: () {
        controller.changeIndex(index);
        controller.switchCaseFetchFilter();
      },
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