import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:limatrack_genetic/app/pages/features/payment_page/payment_model.dart';
import 'package:limatrack_genetic/app/pages/global_component/common_button.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class RincianPembayaranPage extends StatelessWidget {
  const RincianPembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentModel paymentModel = Get.arguments;

    String formattedDate = DateFormat('d MMMM yyyy - HH.mm').format(DateTime.now());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: Colors.black,),
              ),
              Text("Rincian Pemesanan", style: tsBodyLarge.copyWith(fontWeight: FontWeight.w600)),

              Container()
            ],
          )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Total Harga", style: tsBodyMedium.copyWith(fontWeight: FontWeight.w600),),

                          Text("Rp ${paymentModel.totalPrice}", style: tsHeadingLarge.copyWith(fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Divider(height: 1, color: Colors.grey[200]),

                    const SizedBox(height: 20,),

                    SectionText(
                        heading: "Metode Pembayaran",
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(icCashPayment, width: 30, height: 30,),

                                const SizedBox(width: 10,),

                                Text("Bayar Ditempat", style: tsBodySmall.copyWith(fontWeight: FontWeight.w500),),
                              ],
                            ),

                          ],
                        ),
                    ),

                    SectionText(
                      heading: "Pesanan",
                      widget: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Text("${paymentModel.jajanan[index].total} ${paymentModel.jajanan[index].nama}", style: tsBodyMedium.copyWith(fontWeight: FontWeight.w500),)
                      ),
                    ),

                    SectionText(
                      heading: "Tanggal Pemesanan",
                      widget: Text(formattedDate, style: tsBodyMedium.copyWith(fontWeight: FontWeight.w500),),
                    ),

                    SectionText(
                      heading: "Nama Dagangan",
                      widget: Text(paymentModel.namaPedagang, style: tsBodyMedium.copyWith(fontWeight: FontWeight.w500),)
                    )

                  ],
                ),
              ),

              const Spacer(),

              CommonButton(text: "Bayar Sekarang", onPressed: () => Get.toNamed(Routes.PAYMENT_SUCCESS_PAGE), height: 50,)

            ],
          ),
        ),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  const SectionText({
    super.key,
    required this.heading,
    required this.widget

  });

  final String heading;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: tsBodyMedium.copyWith(fontWeight: FontWeight.w600),),

        const SizedBox(height: 10,),

        widget,

        const SizedBox(height: 25,),
      ],
    );
  }
}

