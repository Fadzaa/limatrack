import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:limatrack_genetic/app/api/pedagang/model/list_warung_response.dart';
import 'package:limatrack_genetic/app/api/pedagang/service/pedagang_service.dart';
import 'package:limatrack_genetic/app/pages/features/home_page/widget/items/custom_marker.dart';
import 'dart:ui' as ui;

import '../../../api/pedagang/model/warung.dart';
import '../../../router/app_pages.dart';


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
    // listWarungTerdekat.forEach((warung) {
    //   keys[warung.id.toString()] = GlobalKey();
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback(
    //         (_) => onBuildMarkerComplete()
    // );

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


      listWarungTerdekat.forEach((warung) {
        keys[warung.id.toString()] = GlobalKey();
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        onBuildMarkerComplete();
      });

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
    print('it is running');
    await Future.wait(
        listWarungTerdekat.map((warung) async {
          Marker marker = await generateMarkerFromWidgets(warung);
          markers[marker.markerId.value] = marker;
          print("I printed marker");
          print(marker);
        }
        ));

    print('Current Marker');
    print(markers);

    isMarkerLoaded.value = true;

  }

  Future<Marker> generateMarkerFromWidgets(WarungModel warung) async {
    GlobalKey key = keys[warung.id.toString()]!;
    RenderRepaintBoundary? boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary == null || boundary.debugNeedsPaint) {
      print('Waiting for boundary to be painted.');
      await Future.delayed(const Duration(milliseconds: 20));
      update();
      return generateMarkerFromWidgets(warung);
    }

    ui.Image image = await boundary.toImage(pixelRatio: 2.0);

    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    print('Current Marker');
    print(markers);

    return Marker(
      onTap: () => Get.toNamed(Routes.DETAIL_DAGANG_PAGE, arguments: {'id': warung.id}),
      markerId: MarkerId(warung.id.toString()),
      position: warung.latitude != null && warung.longitude != null ? LatLng(double.parse(warung.latitude!), double.parse(warung.longitude!)) : const LatLng(0, 0),
      icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List()),

      infoWindow: InfoWindow(
        title: warung.namaWarung,
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