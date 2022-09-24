// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_zone/presentation/themes/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static var lightTextTheme = TextTheme(
    headline1: textStyleMethod(
        color: AppColor.blackColor, size: 38.sp, weight: FontWeight.w600),
    headline2: textStyleMethod(
        color: AppColor.blackColor, size: 36.sp, weight: FontWeight.w600),
    headline3: textStyleMethod(
        color: AppColor.blackColor, size: 34.sp, weight: FontWeight.w500),
    headline4: textStyleMethod(
        color: AppColor.blackColor, size: 30.sp, weight: FontWeight.w500),
    headline5: textStyleMethod(
        color: AppColor.blackColor, size: 28.sp, weight: FontWeight.normal),
    headline6: textStyleMethod(
        color: AppColor.blackColor, size: 20.sp, weight: FontWeight.normal),
    subtitle1: textStyleMethod(
        color: AppColor.blackColor, size: 16.sp, weight: FontWeight.normal),
    subtitle2: textStyleMethod(
        color: AppColor.blackColor, size: 14.sp, weight: FontWeight.normal),
    bodyText2: textStyleMethod(
        color: AppColor.blackColor, size: 14.sp, weight: FontWeight.normal),
    bodyText1: textStyleMethod(
        color: AppColor.blackColor, size: 16.sp, weight: FontWeight.normal),
    button: textStyleMethod(
        color: AppColor.whiteColor, size: 16.sp, weight: FontWeight.w600),
    caption: textStyleMethod(color: AppColor.blackColor),
  );
  static const nightTextTheme = TextTheme();
}

textStyleMethod(
    {Color? color,
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    double? wordSpacing,
    double? height}) {
  return GoogleFonts.poppins(
    fontSize: size ?? 14.sp,
    color: color ?? AppColor.blackColor,
    fontWeight: weight ?? FontWeight.normal,
  );
}
