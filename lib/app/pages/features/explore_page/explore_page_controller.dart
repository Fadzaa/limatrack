import 'dart:async';

import 'package:get/get.dart';

import '../../../api/pedagang/model/list_warung_response.dart';
import '../../../api/pedagang/model/warung.dart';
import '../../../api/pedagang/service/pedagang_service.dart';


class ExplorePageController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isLoading = false.obs;

  late PedagangService pedagangService;
  late WarungResponse warungResponse;
  RxList<WarungModel> listWarungTerdekat = <WarungModel>[].obs;

  List list_filter = [
    "Terdekat",
    "Rating 4.5 +",
    "Verifikasi Halal"
  ];

  @override
  void onInit() {
    super.onInit();

    pedagangService = PedagangService();
    warungResponse = WarungResponse();

    fetchPedagangNearest();
  }

  Future fetchPedagangNearest() async {
    try {
      isLoading.value = true;

      final response = await pedagangService.getPedagangNearest();

      warungResponse = WarungResponse.fromJson(response.data);
      listWarungTerdekat = warungResponse.data.obs;

    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future fetchPedagangSearch(String query) async {
    try {
      listWarungTerdekat.clear();

      isLoading.value = true;

      final response = await pedagangService.getPedagangSearch(query: query);

      warungResponse = WarungResponse.fromJson(response.data);
      listWarungTerdekat = warungResponse.data.obs;

    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }


}