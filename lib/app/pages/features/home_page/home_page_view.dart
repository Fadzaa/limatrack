import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limatrack_genetic/app/api/auth/model/user.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/advertise_section.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/nearest_section.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/recommendation_section.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  HomePageView({
    super.key,
    required this.user
  });

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Hello,", style: tsBodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                      ),
                      ),

                      const SizedBox(height: 10,),

                      Text(" ${user.namaLengkap}👋", style: tsBodyMedium),
                    ],
                  ),

                  Text("Ayo Lacak Pedagang Disekitarmu", style: tsBodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF707070).withOpacity(0.7)
                  ),)

                ],
              ),

              SvgPicture.asset(icNotification)

            ],
          )
        ),
        automaticallyImplyLeading: false,

      ),

      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height * 0.7,
                child: const GoogleMap(
                  initialCameraPosition:  CameraPosition(
                    target: LatLng(-6.966667, 110.416664),
                    zoom: 15,
                  ),
                )
              ),

              const ContainerContent(),
            ],
          ),
        ),
      ),
      backgroundColor: baseColor,
      resizeToAvoidBottomInset: false,
    );
  }
}

class ContainerContent extends StatelessWidget {
  const ContainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 20,),

          Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
              )

          ),

          const AdvertiseSection(),

          const RecommendationSection(),

          const SizedBox(height: 20),

          const NearestSection()

        ],
      ),
    );
  }
}








