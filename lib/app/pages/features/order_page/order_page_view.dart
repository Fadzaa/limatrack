import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/items/item_order_complete.dart';
import 'package:limatrack_genetic/app/pages/features/order_page/items/item_order_ongoing.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/app/pages/global_component/not_found_page/not_found_page.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';
import 'order_page_controller.dart';

class OrderPageView extends GetView<OrderPageController> {
  const OrderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Orderanmu", style: tsTitleMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor
              ),),

              TabBar(
                  indicatorColor: primaryColor,
                  labelColor: primaryColor,
                  unselectedLabelColor: const Color(0xFF707070).withOpacity(0.7),
                  labelStyle: tsBodyMedium.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                  unselectedLabelStyle: tsBodyMedium.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.only(right: 20),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: controller.tabController,
                  tabs: const [
                    Tab(text: "Selesai"),
                    Tab(text: "Sedang Dipesan"),
                  ]
              ),

              const SizedBox(height: 20,),

              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                    children: const [
                      OrderCompleteView(),
                      OrderOngoingView()
                    ]
                ),
              )



            ],
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

    return list_order.length != 0 ?  ListView.builder(
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
    ) : NotFoundPage(
        image: notFoundExplore,
        title: "Kami Tidak Menemukannya",
        subtitle: "Perbaiki Kata Kunci atau Cari Makanan Lainnya"
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
        list_order.length != 0 ?  ListView.builder(
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
            : NotFoundPage(
            image: notFoundExplore,
            title: "Kami Tidak Menemukannya",
            subtitle: "Perbaiki Kata Kunci atau Cari Makanan Lainnya"
        ),
      ],
    );
  }
}









