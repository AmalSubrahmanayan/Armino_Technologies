import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

class HeaderController extends GetxController {
  final globalController = Get.put(GlobalController(), permanent: true);

  RxString city = ''.obs;
  RxList<WeatherModel> weatherList = <WeatherModel>[].obs;

  RxString date = DateFormat("yMMMMd").format(DateTime.now()).obs;
  @override
  void onInit() {
    // getAddress(globalController.getLatitude().value,
    //     globalController.getLongitude().value);
    getWeather(globalController.getLatitude().value,
        globalController.getLongitude().value);

    super.onInit();
  }

  getAddress(lat, long) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, long);
    Placemark place = placeMark[0];
    city.value = place.locality!;
    log(city.value);
  }

  void getWeather(lat, long) async {
    final WeatherModel? response =
        await WeatherServices().getCurrentWeather(lat, long);
    log("$response---controller");
    if (response != null) {
      weatherList.add(response);
      log(weatherList.toString());
    }
  }
}
