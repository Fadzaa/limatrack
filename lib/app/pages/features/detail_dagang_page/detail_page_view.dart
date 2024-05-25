import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/floating_bottom_cart.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/widget/list_chip.dart';
import 'package:limatrack_genetic/app/pages/global_component/loading_overlay.dart';
import 'package:limatrack_genetic/common/theme.dart';
import '../../../../common/constant.dart';
import 'detail_page_controller.dart';
import 'sections/jajan_utama_section.dart';
import 'sections/semua_jajanan_section.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: baseColor,
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => LoadingOverlay(
            isLoading: controller.isLoading.value,
            child: const Column(
              children: [
                Header(),
                Body(),
              ],
            ),
          ))
        ),
      ),
      floatingActionButton: Obx(() => controller.total.value > 0 ? const FloatingBottomCart() : const SizedBox()
      ),
    );
  }
}

class Header extends GetView<DetailPageController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: height * 0.30,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(controller.warungModel.banner), fit: BoxFit.fill),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(20),
          height: height * 0.30,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(icCloseWhite),
                  ),

                  Row(
                    children: [
                      SvgPicture.asset(icLocation),

                      const SizedBox(width: 5,),

                      Text(controller.warungModel.daerahDagang, style: tsBodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),

                      const SizedBox(width: 5,),

                      SvgPicture.asset(icArrowRight)
                    ],
                  )

                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.warungModel.sertifikasiHalal ? Image.asset(icHalal) : SizedBox(),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(icTime),

                              const SizedBox(width: 4,),

                              Text("", style: tsLabelLarge.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),)
                            ],
                          ),

                          Text(controller.warungModel.namaWarung, style: tsTitleSmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),),
                        ],
                      ),

                      Row(
                        children: [
                          SvgPicture.asset(icBookmark),

                          const SizedBox(width: 10,),

                          SvgPicture.asset(icMessageFill)
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListChip(),

          SizedBox(height: 20,),
          
          JajanUtamaSection(),

          SizedBox(height: 25,),

          SemuaJajananSection(),
          
        ],
      )
    );
  }
}










