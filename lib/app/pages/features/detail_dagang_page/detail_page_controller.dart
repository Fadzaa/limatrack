import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/list_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/single_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/model/jajan.dart';


class DetailPageController extends GetxController {
  RxInt total = 0.obs;
  RxInt totalPrice = 0.obs;

  List<JajananModel> data_jajan = [];
  RxBool isLoading = false.obs;
  late PedagangService pedagangService;
  late SingleWarungResponse singleWarungResponse;
  WarungModel warungModel = WarungModel();
  List<JajananModel> jajanan_utama = [];
  List<JajananModel> semua_jajanan = [];

  var arguments = Get.arguments;

  @override
  void onInit() {
    pedagangService = PedagangService();


    getPedagangById(arguments['id']);
    print(arguments['id']);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  Future getPedagangById(String id) async {
    try {
      isLoading.value = true;
      final response = await pedagangService.getPedagangById(id);
      singleWarungResponse = SingleWarungResponse.fromJson(response.data);
      warungModel = singleWarungResponse.data;

      jajanan_utama = warungModel.jajanan.where((element) => element.kategori == 'Jajanan Utama').toList();
      semua_jajanan = warungModel.jajanan.where((element) => element.kategori == 'Lainnya').toList();
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }


  void incrementCounter(RxInt counter, RxInt price) {
    counter.value++;
    total.value++;
    totalPrice.value += price.value;
  }

  void decrementCounter(RxInt counter, RxInt price) {
    counter.value--;
    total.value--;
    totalPrice.value -= price.value;
  }

  void initialAddCounter(RxInt counter, JajananModel jajan) {
    data_jajan.add(jajan);
    counter.value++;
    total.value++;
    totalPrice.value += jajan.harga;
  }


  void removeDataJajan(RxInt counter, JajananModel jajan) {
    data_jajan.remove(jajan);
    counter.value--;
    total.value--;
    totalPrice.value -= jajan.harga;
  }


}