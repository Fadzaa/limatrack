import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/list_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

import '../../../api/pedagang/model/warung.dart';


class HomePageController extends GetxController {
  RxBool isLoading = false.obs;

  //Pagination Init
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  //API Init
  late PedagangService pedagangService;
  late WarungResponse warungResponse;
  RxList<WarungModel> listWarung = <WarungModel>[].obs;
  RxList<WarungModel> listWarungTerdekat = <WarungModel>[].obs;

  //Google Maps Init
  Rx<LatLng> currentLocation = const LatLng(0, 0).obs;
  GoogleMapController? mapController;

  //Custom Widget Marker Init
  RxBool isMarkerLoaded = false.obs;
  Map<String, GlobalKey> keys = {};
  Map<String, Marker> markers = {};

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => onBuildMarkerComplete);
    pageController = PageController(initialPage: 0);
    pedagangService = PedagangService();

    warungResponse = WarungResponse();

    fetchPedagangAll();
    fetchPedagangNearest();

    getCurrentLocation();
  }

  void changePage(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
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

      for (var warung in listWarungTerdekat) {
        keys[warung.id] = GlobalKey();
      }


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

  Future<void> onBuildMarkerComplete() async {
    await Future.wait(
        listWarungTerdekat.map((warung) async {
          Marker marker = await generateMarkerFromWidgets(warung);
          markers[warung.id] = marker;
        }
        ));

    isMarkerLoaded.value = true;
  }

  Future<Marker> generateMarkerFromWidgets(WarungModel data) async {
    RenderRepaintBoundary boundary = keys[data.id]!.currentContext!.findRenderObject()
    as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 2.0);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return Marker(
      markerId: MarkerId(data.id),
      position: LatLng(double.parse(data.latitude.toString()), double.parse(data.longitude.toString())),
      icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List()),
      infoWindow: InfoWindow(
        title: data.namaWarung,
      ),
    );
  }





  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

}