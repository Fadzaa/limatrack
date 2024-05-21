import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/list_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/pedagang/model/warung.dart';


class HomePageController extends GetxController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  RxBool isLoading = false.obs;

  late PedagangService pedagangService;
  late WarungResponse warungResponse;
  RxList<WarungModel> listWarung = <WarungModel>[].obs;
  RxList<WarungModel> listWarungTerdekat = <WarungModel>[].obs;

  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;
  GoogleMapController? mapController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    pedagangService = PedagangService();

    warungResponse = WarungResponse();

    fetchPedagangAll();
    fetchPedagangNearest();

    getCurrentLocation();
  }


  Future fetchPedagangAll() async {
    try {
      isLoading.value = true;

      final response = await pedagangService.getPedagangAll();

      print("Fetch Semua Warung");
      print(response.data);

      warungResponse = WarungResponse.fromJson(response.data);
      listWarung = warungResponse.data.obs;


      print(listWarung);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future fetchPedagangNearest() async {
    try {
      isLoading.value = true;

      final response = await pedagangService.getPedagangNearest();

      print("Fetch Warung Terdekat");
      print(response.data);

      warungResponse = WarungResponse.fromJson(response.data);
      listWarungTerdekat = warungResponse.data.obs;


      print(listWarung);
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          return Future.error(
              'Location permissions are denied (actual value: $permission).');
        }
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentLocation.value = LatLng(position.latitude, position.longitude);
      print("CHECK CURRENT LOCATION");
      print(currentLocation.value);

      mapController?.animateCamera(
        CameraUpdate.newLatLng(currentLocation.value),
      );
    } catch (e) {
      print(e);
    }
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

}