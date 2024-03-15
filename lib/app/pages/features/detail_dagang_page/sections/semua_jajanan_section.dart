import 'package:flutter/material.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/items/item_jajan_detail_vertical.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/app/pages/global_component/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/common/theme.dart';

class SemuaJajananSection extends StatelessWidget {
  const SemuaJajananSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Semua Jajanan", style: tsBodyLarge.copyWith(
            fontWeight: FontWeight.w600
        ),),

        const SizedBox(height: 10,),

        ListView.builder(
            itemCount: jajan_data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: () {
                    detailJajanBottomSheet();
                  },
                  child: ItemJajanDetailVertical(
                      image: jajan_data[index].image,
                      name: jajan_data[index].name,
                      description: jajan_data[index].description,
                      price: jajan_data[index].price,
                      stockEmpty: jajan_data[index].stockEmpty,
                      jajan: jajan_data[index],
                  ),
                )
        )
      ],
    );
  }
}