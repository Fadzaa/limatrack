import 'package:flutter/material.dart';
import 'package:limatrack_genetic/common/constant.dart';
import 'package:limatrack_genetic/common/theme.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({
    super.key,
    required this.isOrder
  });

  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.close, color: Colors.black, size: 30,)
      ),),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(successVector),

              const SizedBox(height: 20,),

              Text(isOrder ? "Pesanan Diterima" : "Pembayaran Berhasil", style: tsTitleLarge.copyWith(fontWeight: FontWeight.w900),),

              const SizedBox(height: 10,),

              Text(
                "Pedagang Akan Segera Membuatkan Jajananmu ya...",
                style: tsBodyMedium.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
