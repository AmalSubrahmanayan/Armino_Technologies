import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class AppTextStyles {
  static const summaryTextSty = TextStyle(
    // fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 26,
    color: AppColors.whiteA700,
  );
  static const listHeadTextStyle = TextStyle(
    fontFamily: 'Calibri',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.gray600,
  );
  static const dateTimeTextStyle = TextStyle(
    fontFamily: 'Calibri',
    // fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.whiteA700,
  );
  static const normalTextStyle = TextStyle(
    fontFamily: 'Calibri',
    // fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.deepOrange100,
  );
  static const summaryTextStyle = TextStyle(
    fontFamily: 'Calibri',
    // fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.whiteA700,
  );
  static const headingTextStyle = TextStyle(
    fontFamily: 'Cambria',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.deepOrange100,
  );
  static const temperatureTextStyle = TextStyle(
    fontFamily: 'Cambria',
    fontWeight: FontWeight.bold,
    fontSize: 80,
    color: AppColors.deepOrange100,
  );
}
