import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/item_jajan_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/sections/section_text.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';



class NearestSection extends StatelessWidget {
  const NearestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionText(
              heading: "Terdekat Kamu",
              subHeading: "Jajanan Terdekat Dari Lokasimu",
              navigatedTo: Routes.HOME_PAGE
          ),

          const SizedBox(height: 20,),

          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jajan_data.length,
              itemBuilder: (context, index) =>
                  ItemJajanVertical(
                      image: jajan_data[index].image,
                      name: jajan_data[index].name,
                      rating: jajan_data[index].rating,
                      isHalal: jajan_data[index].isHalal
                  )
          ),
        ],
      ),
    );
  }
}