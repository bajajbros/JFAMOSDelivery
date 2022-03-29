import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  //ask for permition
  static Future<bool> askPermission() async {
    var status = await Permission.location.status;
    if (status == PermissionStatus.denied) {
      status = await Permission.location.request();
    }
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  //get location
  Future<double> getLatitude() async {
    await askPermission();
    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return currentLocation.latitude;
  }

  // ignore: prefer_function_declarations_over_variables
  Future<double> getLongitude() async {
    await askPermission();
    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return currentLocation.longitude;
  }
}
