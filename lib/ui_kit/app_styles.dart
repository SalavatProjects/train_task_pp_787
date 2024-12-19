import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static const displayLarge = TextStyle(
    fontFamily: 'SF Pro',
    height: 1.25,
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: AppColors.black
  );

  static const displaySmall = TextStyle(
      fontFamily: 'SF Pro',
      height: 1,
      fontSize: 26,
      fontWeight: FontWeight.w400,
      color: AppColors.black
  );

  static const bodyMedium = TextStyle(
      fontFamily: 'SF Pro',
      height: 1.375,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.black
  );

  static const labelMedium = TextStyle(
      fontFamily: 'SF Pro',
      height: 1.333,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.black
  );
}