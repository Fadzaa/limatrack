import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:limatrack_genetic/app/api/cart/cart_response.dart';
import 'package:limatrack_genetic/app/api/cart/cart_service.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/single_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/warung.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:limatrack_genetic/app/pages/features/detail_dagang_page/model/jajanan_local_model.dart';
import 'package:limatrack_genetic/app/router/app_pages.dart';


class DetailPageController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt total = 0.obs;
  RxInt totalPrice = 0.obs;

  late PedagangService pedagangService;
  late SingleWarungResponse singleWarungResponse;
  late WarungModel warungModel = WarungModel();

  late CartService cartService;


  //Local State
  List<JajananLocalModel> data_jajan = [];

  //Network Data
  List<JajananModel> jajanan_utama = [];
  List<JajananModel> semua_jajanan = [];

  var arguments = Get.arguments;

  @override
  void onInit() {
    pedagangService = PedagangService();
    warungModel = WarungModel();

    cartService = CartService();


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

  Future storeJajanToCart(JajananLocalModel jajan) async {
    try {
      isLoading.value = true;
      final response = await cartService.storeCart(jajan.pedagangId, jajan.id, jajan.total, jajan.total * jajan.harga);
      print(response.data);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void storeAllJajanToCart() {
    // for (var item in data_jajan) {
    //   storeJajanToCart(item);
    // }

    Get.toNamed(Routes.CART_PAGE, arguments: [data_jajan, warungModel]);
  }

  void addDataJajan(RxInt counter, JajananModel jajan) {
    JajananLocalModel jajananLocalModel =  JajananLocalModel();

    jajananLocalModel.id = jajan.id;
    jajananLocalModel.nama = jajan.nama;
    jajananLocalModel.image = jajan.image;
    jajananLocalModel.pedagangId = jajan.pedagangId;
    jajananLocalModel.harga = jajan.harga;
    jajananLocalModel.total = 1;

    counter.value++;
    total.value++;
    totalPrice.value += jajan.harga;

    if (jajananLocalModel.id == data_jajan.where((element) => element.id == jajananLocalModel.id).firstOrNull?.id ){
      data_jajan.where((element) => element.id == jajananLocalModel.id).firstOrNull?.total += 1;

    } else {
      data_jajan.add(jajananLocalModel);
    }

    print("Jajan Length: ${data_jajan.length}");
    print("Jajanan: ");

    for (var item in data_jajan) {
      print(item.total);
    }

  }

  void removeDataJajan(RxInt counter, JajananModel jajan) {

    JajananLocalModel jajananLocalModel =  JajananLocalModel();

    jajananLocalModel.id = jajan.id;
    jajananLocalModel.nama = jajan.nama;
    jajananLocalModel.image = jajan.image;
    jajananLocalModel.pedagangId = jajan.pedagangId;
    jajananLocalModel.harga = jajan.harga;
    jajananLocalModel.total = 1;

    counter.value--;
    total.value--;
    totalPrice.value -= jajan.harga;

    if (jajananLocalModel.id == data_jajan.where((element) => element.id == jajananLocalModel.id).firstOrNull?.id ){

      if (data_jajan.where((element) => element.id == jajananLocalModel.id).firstOrNull?.total == 1) {
        data_jajan.removeWhere((element) => element.id == jajananLocalModel.id);
      } else {
        data_jajan.where((element) => element.id == jajananLocalModel.id).firstOrNull?.total -= 1;
      }

    }

    print("Jajan Length: ${data_jajan.length}");
    print("Jajanan: ");

    for (var item in data_jajan) {
      print(item.total);
    }
  }


}

// void incrementCounter(RxInt counter, RxInt price) {
//   counter.value++;
//   total.value++;
//   totalPrice.value += price.value;
// }
//
// void decrementCounter(RxInt counter, RxInt price) {
//   counter.value--;
//   total.value--;
//   totalPrice.value -= price.value;
// }
//
// void initialAddCounter(RxInt counter, JajananModel jajan) {
//   data_jajan.add(jajan);
//   counter.value++;
//   total.value++;
//   totalPrice.value += jajan.harga;
// }