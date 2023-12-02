import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/service/weather_service.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  dynamic currentWeatherData;
  dynamic hourlyWeatherData;
  @override
  void onInit() async {
    if (checkLoading().isTrue) {
      await getLocation();
    }
    log("${_latitude.value}----before");
    currentWeatherData = WeatherServices()
        .getCurrentWeather(getLatitude().value, getLongitude().value);
    hourlyWeatherData = WeatherServices()
        .getHourlyWeather(getLatitude().value, getLongitude().value);

    log(_latitude.value.toString());

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Loction permission denied');
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      _isLoading.value = false;
    });
  }
}
