import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_text_styles.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/model/hourly_weather_model.dart';
import 'package:weather_app/utils/custom_image_view.dart';
import 'package:weather_app/utils/image_constant.dart';

Widget homeSecondContainer(BuildContext context) {
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
                    height: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                var time = DateFormat.jm().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                    hourlyData.list![index].dt!.toInt() * 1000,
                                  ),
                                );
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(right: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        time,
                                        style: AppTextStyles.dateTimeTextStyle,
                                      ),
                                      Row(
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgVectorWhiteA700,
                                            height: 20,
                                            width: 20,
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                top: 5, right: 5),
                                          ),
                                          Text(
                                            "${hourlyData.list![index].main!.temp}°",
                                            style:
                                                AppTextStyles.dateTimeTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 26, right: 26),
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                            height: 10,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              var time = DateFormat.jm().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  hourlyData.list![index + 5].dt!.toInt() *
                                      1000,
                                ),
                              );
                              return Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      time,
                                      style: AppTextStyles.dateTimeTextStyle,
                                    ),
                                    Row(
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgVectorWhiteA700,
                                          height: 20,
                                          width: 20,
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              top: 5, right: 5),
                                        ),
                                        Text(
                                          "${hourlyData.list![index + 5].main!.temp}°",
                                          style:
                                              AppTextStyles.dateTimeTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
