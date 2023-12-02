import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_text_styles.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/hourly_weather_model.dart';
import 'package:weather_app/utils/custom_image_view.dart';
import 'package:weather_app/utils/image_constant.dart';

Widget home7DaysContainer(BuildContext context) {
  final globalController = Get.put(GlobalController(), permanent: true);

  return Obx(
    () => globalController.checkLoading().isTrue
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.whiteA700,
            ),
          )
        : FutureBuilder(
            future: globalController.hourlyWeatherData,
            builder: (context, AsyncSnapshot snapshot) {
              try {
                if (snapshot.hasError) {
                  throw Exception('Error loading data: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  HourlyWeatherData hourlyData = snapshot.data!;

                  return SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hourlyData.list!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var time = DateFormat.jm().format(
                          DateTime.fromMillisecondsSinceEpoch(
                            hourlyData.list![index].dt!.toInt() * 1000,
                          ),
                        );
                        var days = DateFormat('EEEE')
                            .format(hourlyData.list![index].dtTxt!);
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: const RadialGradient(
                                center: Alignment(0.009, 2.98),
                                radius: 97.57,
                                colors: [
                                  Color.fromRGBO(172, 115, 106, 0.525),
                                  Color.fromRGBO(172, 115, 106, 0.225),
                                ],
                                stops: [0, 1],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  days,
                                  style: AppTextStyles.listHeadTextStyle,
                                ),
                                Text(
                                  time,
                                  style: AppTextStyles.dateTimeTextStyle,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorWhiteA700,
                                      height: 24,
                                      width: 24,
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(
                                          top: 5, right: 5),
                                    ),
                                    Text(
                                      '${hourlyData.list![index].main!.temp}°',
                                      style: AppTextStyles.listHeadTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${hourlyData.list![index].main!.tempMin}°/',
                                        style: AppTextStyles.listHeadTextStyle,
                                      ),
                                      TextSpan(
                                        text:
                                            '${hourlyData.list![index].main!.tempMax}°',
                                        style: AppTextStyles.listHeadTextStyle,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteA700,
                    ),
                  );
                }
              } catch (e) {
                print('Unexpected error: $e');
                return const Center(
                  child: Text('An unexpected error occurred.'),
                );
              }
            },
          ),
  );
}
