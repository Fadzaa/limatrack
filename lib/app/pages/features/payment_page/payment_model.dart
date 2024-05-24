import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/model/jajanan_local_model.dart';

class PaymentModel{
  int totalPrice;
  String paymentMethod;
  List<JajananLocalModel> jajanan;
  String namaPedagang;

  PaymentModel({
    required this.totalPrice,
    required this.paymentMethod,
    required this.jajanan,
    required this.namaPedagang
  });

}