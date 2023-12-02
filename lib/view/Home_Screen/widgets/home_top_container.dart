import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_sized_boxes.dart';
import 'package:weather_app/constants/app_text_styles.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/controller/header_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/custom_image_view.dart';
import 'package:weather_app/utils/image_constant.dart';

class HomeTopContainer extends StatelessWidget {
  HomeTopContainer({super.key});
  final globalController = Get.put(GlobalController(), permanent: true);
  final headerController = Get.put(HeaderController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => globalController.checkLoading().isTrue
          ? const Center(
              child: Center(
              child: CircularProgressIndicator(
                color: AppColors.whiteA700,
              ),
            ))
          : FutureBuilder(
              future: globalController.currentWeatherData,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  WeatherModel data = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizedBoxes.sizedboxH10,

                      const Text(
                        "Today",
                        style: AppTextStyles.headingTextStyle,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 72,
                            width: 95,
                            alignment: Alignment.topLeft,
                            // margin: EdgeInsets.only(top: 5),
                          ),
                          AppSizedBoxes.sizedboxW10,
                          Text(
                            '${data.main!.temp}°',
                            style: AppTextStyles.temperatureTextStyle,
                          )
                        ],
                      ),
                      AppSizedBoxes.sizedboxH10,
                      Text(
                        '${data.weather![0].main}',
                        style: AppTextStyles.headingTextStyle,
                      ),
                      AppSizedBoxes.sizedboxH10,
                      Text(
                        "${data.name}",
                        style: AppTextStyles.normalTextStyle,
                      ),
                      AppSizedBoxes.sizedboxH10,
                      Obx(
                        () => Text(headerController.date.value,
                            style: AppTextStyles.normalTextStyle),
                      ),
                      //  Text(
                      //   "21 Oct 2023",
                      //   style: AppTextStyles.normalTextStyle,
                      // ),
                      AppSizedBoxes.sizedboxH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Min : ${data.main!.tempMin}°',
                            style: AppTextStyles.normalTextStyle,
                          ),
                          Text(
                            'Max : ${data.main!.tempMax}°',
                            style: AppTextStyles.normalTextStyle,
                          ),
                          Container(
                            height: 22, // Adjust the height of the line
                            width: 2, // Adjust the width of the line
                            color: AppColors
                                .deepOrange100, // Change the color of the line
                            margin: const EdgeInsets.symmetric(
                                horizontal:
                                    10), // Adjust the space between texts and the line
                          ),
                          const Text(
                            'Sunset 18:12',
                            style: AppTextStyles.normalTextStyle,
                          ),
                        ],
                      ),
                      AppSizedBoxes.sizedboxH20,
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.whiteA700,
                    ),
                  );
                }
              },
            ),
    );
  }
}
