import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limatrack_genetic/app/api/auth/model/user.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/custom_marker.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/advertise_section.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/nearest_section.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/recommendation_section.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  HomePageView({
    super.key,
    required this.namaLengkap,
    required this.isLoadingUser
  });

  final RxString namaLengkap;
  final RxBool isLoadingUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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

                        Obx(() {
                          return isLoadingUser.value
                              ? Text('')
                              : Text(
                            " ${namaLengkap.value} 👋",
                            style: tsBodyMedium,
                          );
                        }),
                      ],
                    ),

                    Text("Ayo Temukan Pedagang Di sekitarmu", style: tsBodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF707070).withOpacity(0.7)
                    ),)

                  ],
                ),

              ],
            )
        ),
        automaticallyImplyLeading: false,

      ),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height * 1,
                child: Obx(() =>
                controller.isMarkerLoaded.value ?
                GoogleMap(
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.mapController = googleMapController;
                  },
                  initialCameraPosition: CameraPosition(
                    target: controller.currentLocation.value,
                    zoom: 15,
                  ),


                  markers: controller.markers.values.toSet(),
                  // Set<Marker>.of(controller.listWarungTerdekat.map((warung) {
                  //   return warung.latitude != null && warung.longitude != null ? Marker(
                  //
                  //     markerId: MarkerId(warung.id.toString()),
                  //     position: LatLng(double.parse(warung.latitude.toString()), double.parse(warung.longitude.toString())),
                  //     infoWindow: InfoWindow(
                  //       title: warung.namaWarung,
                  //     ),
                  //   ) : Marker(markerId: MarkerId(warung.id.toString()));
                  // }).toList())

                ) :
                //Rendering Custom Marker as a list but make it hidden
                ListView(
                  children: [
                    for (int i = 0; i < controller.listWarungTerdekat.length; i++)

                      Transform.translate(
                        offset: Offset(
                          -MediaQuery.of(context).size.width * 2,
                          -MediaQuery.of(context).size.height * 2,
                        ),
                        child: RepaintBoundary(
                          key: controller.keys[controller.listWarungTerdekat[i].id],
                          child: CustomMarker(
                            imageUrl: controller.listWarungTerdekat[i].banner ?? exampleAds,
                          ),
                        ),
                      )
                  ],
                )
                )
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 1,
              builder: (context, scrollableController) =>
                  SingleChildScrollView(
                      controller: scrollableController,
                      child: const ContainerContent()
                  ),
            )
          ],
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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
        color: Colors.white,
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