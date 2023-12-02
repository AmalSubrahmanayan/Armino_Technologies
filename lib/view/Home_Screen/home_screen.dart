import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_text_styles.dart';
import 'package:weather_app/utils/image_constant.dart';
import 'package:weather_app/view/Home_Screen/widgets/home_7days_container.dart';
import 'package:weather_app/view/Home_Screen/widgets/home_scond_container.dart';
import 'package:weather_app/view/Home_Screen/widgets/home_top_container.dart';
import 'package:weather_app/view/Home_Screen/widgets/weather_description.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            ImageConstant.imgCloudyThree,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              // Section 1: HomeTopContainer
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Container(
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.gray600,
                  ),
                  child: HomeTopContainer(),
                ),
              ),

              // Section 2: homeSecondContainer
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
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
                  child: homeSecondContainer(context),
                ),
              ),

              // Section 3: Next 7 Days
              const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                child: Text('Next 7 Days', style: AppTextStyles.summaryTextSty),
              ),

              // Section 4: home7DaysContainer
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
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
                  child: home7DaysContainer(context),
                ),
              ),

              // Section 5: Weather Details
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: WeatherDescription(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
