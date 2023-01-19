import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class mapController extends GetxController{
  final Completer<GoogleMapController> controller1 = Completer();
  @override
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  void onInit() {
    // 컨트롤러 생성시 호출되는 메서드
    super.onInit();
  }
  Future<void> goToTheLake() async {
    final GoogleMapController controller = await controller1.future;
  }

}
