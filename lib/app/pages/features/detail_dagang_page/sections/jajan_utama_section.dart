import 'package:flutter/material.dart';
import 'package:limatrack_genetic/app/pages/features/bottom_sheet/detail_jajan_bottom_sheet.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/items/item_jajan_grid.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan_data.dart';
import 'package:limatrack_genetic/common/theme.dart';

class JajanUtamaSection extends StatelessWidget {
  const JajanUtamaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jajanan Utama", style: tsBodyLarge.copyWith(
            fontWeight: FontWeight.w600
        ),),

        Text("Rekomendasi Dari Pedagang nih...", style: tsLabelMedium.copyWith(
            fontWeight: FontWeight.w600
        ),),

        const SizedBox(height: 15,),

        GridView.builder(
            shrinkWrap: true,
            itemCount: jajan_data.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: () {
                    detailJajanBottomSheet();
                  },
                  child: ItemJajanGrid(
                    image: jajan_data[index].image,
                    name: jajan_data[index].name,
                    description: jajan_data[index].description,
                    price: jajan_data[index].price,
                    stockEmpty: jajan_data[index].stockEmpty,
                  ),
                )

        ),
      ],
    );
  }
}