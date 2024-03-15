import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/chat_page/items/item_chat_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/explore_page/items/item_explore_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/items/item_order_complete.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/items/item_order_ongoing.dart';
import 'package:limatrack_genetic/app/pages/features/profile_page/items/item_profile_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/profile_page/model/profile_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profil Kamu", style: tsTitleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: blackColor
                ),),

                const SizedBox(height: 20,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(exampleJajanRectangle), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Radya Harbani", style: tsBodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor
                        ),),

                        const SizedBox(height: 5,),

                        Text("radya@gmail.com", style: tsLabelLarge),
                      ],
                    ),

                    const Spacer(),

                    Icon(Icons.edit)


                  ],
                ),

                const SizedBox(height: 30,),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list_profile.length,
                    itemBuilder: (context, index) =>
                    ItemProfileVertical(
                        color: list_profile[index].color,
                        icon: list_profile[index].icon,
                        name: list_profile[index].name,
                        routes: list_profile[index].name,
                        isDarkMode: list_profile[index].isDarkMode
                    )
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN_PAGE),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dangerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout, color: Colors.white,),
                        const SizedBox(width: 10,),
                        Text("Keluar", style: tsBodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),)
                      ],
                    )
                )



              ],
            ),
          ),
        ),
      )
    );
  }
}

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> list_order = [
      {
        "tanggal": "1 Feb 2023",
        "orders": [
          {
            "image": exampleJajanRectangle,
            "name": "Telur Gulung",
            "description": "3 Telur Gulung",
            "price": 10000,
            "isReady": true
          }
        ]
      },
      {
        "tanggal": "2 Feb 2023",
        "orders": [
          {
            "image": exampleJajanRectangle,
            "name": "Telur Gulung",
            "description": "Telur Digulung",
            "price": 10000,
            "isReady": true
          }
        ]
      }
    ];

    return ListView.builder(
        itemCount: list_order.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(list_order[index]["tanggal"], style: tsBodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: greyColor
                ),),

                const SizedBox(height: 10,),

                ListView.builder(
                    itemCount: list_order[index]["orders"].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, indexFood) =>
                        InkWell(
                          onTap: () => detailJajanBottomSheet(),
                          child: ItemOrderComplete(
                            image: list_order[index]["orders"][indexFood]["image"],
                            name: "Telur Gulung",
                            description: "Telur Digulung",
                            price: 10000,
                          ),
                        )
                ),
                const SizedBox(height: 20,)
              ],
            )
    );
  }
}


class OrderOngoingView extends StatelessWidget {
  const OrderOngoingView({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map> list_order = [
      {
        "tanggal": "1 Feb 2023",
        "orders": [
          {
            "image": exampleJajanRectangle,
            "name": "Telur Gulung",
            "description": "Telur Digulung",
            "price": 10000,
            "isReady": true
          },
          {
            "image": exampleJajanRectangle,
            "name": "Telur Gulung",
            "description": "Telur Digulung",
            "price": 10000,
            "isReady": false
          }
        ]
      },
      {
        "tanggal": "2 Feb 2023",
        "orders": [
          {
            "image": exampleJajanRectangle,
            "name": "Telur Gulung",
            "description": "Telur Digulung",
            "price": 10000,
            "isReady": true
          }
        ]
      }
    ];

    return Column(
      children: [
        ListView.builder(
            itemCount: list_order.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index) => 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list_order[index]["tanggal"], style: tsBodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: greyColor
                    ),),

                    const SizedBox(height: 10,),
                    
                    ListView.builder(
                        itemCount: list_order[index]["orders"].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, indexFood) =>
                      InkWell(
                        onTap: () => detailJajanBottomSheet(),
                        child: ItemOrderOngoing(
                          image: list_order[index]["orders"][indexFood]["image"],
                          name: "Telur Gulung",
                          description: "Telur Digulung",
                          price: 10000,
                          isReady: list_order[index]["orders"][indexFood]["isReady"],
                        ),
                      )
                    ),
                    const SizedBox(height: 20,)
                  ],
                )
        )
      ],
    );
  }
}









