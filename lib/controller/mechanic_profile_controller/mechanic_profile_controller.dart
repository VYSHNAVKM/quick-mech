import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MechanicProfileController with ChangeNotifier {
  Position? currentLocation;
  var error;
  var distanceBetween;
  var distanceInKm;
  var roundDistanceInKM;
  void callMechanic() async {
    if (!await launchUrl(Uri(scheme: 'tel', path: '7558095349'))) {
      throw ('Could not launch ${Uri(scheme: 'tel', path: '7558095349')}');
    }
    notifyListeners();
  }

  void callCustomerService() async {
    if (!await launchUrl(Uri(scheme: 'tel', path: '0123456789'))) {
      throw ('Could not launch ${Uri(scheme: 'tel', path: '0123456789')}');
    }
    notifyListeners();
  }

  void launchWhatsapp({required number, required name}) async {
    String message =
        'Hi, I am $name. I need urgent roadside assistance. Please help me.';
    String url = "whatsapp://send?phone=$number&text=$message";
    if (!await launchUrl(Uri.parse(url))) {
      throw ('Can\'t open whatsapp');
    }
    notifyListeners();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      error = Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        error = Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      error = Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currentLocation!.latitude);
    print(currentLocation!.longitude);
    notifyListeners();
  }

  getDistanceBetween(mechanicDetails) async {
    distanceBetween = await Geolocator.distanceBetween(
        mechanicDetails.currentLocation.latitude,
        mechanicDetails.currentLocation.longitude,
        currentLocation!.latitude,
        currentLocation!.longitude);
    distanceInKm = await distanceBetween / 1000;
    roundDistanceInKM = await double.parse((distanceInKm).toStringAsFixed(2));
    notifyListeners();
  }
}
