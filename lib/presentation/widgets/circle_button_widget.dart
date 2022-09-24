// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:news_zone/commons/size_constants.dart';
import 'package:news_zone/presentation/themes/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget({
    Key? key,
    this.icons,
    this.bgColor,
    this.iconColor,
    required this.onTap,
  }) : super(key: key);
  final IconData? icons;
  final Color? bgColor;
  final Color? iconColor;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: bgColor ?? AppColor.pupleColor,
        splashRadius: AppSize.dimen_20.r,
        onPressed: onTap,
        icon: Icon(
          icons ?? Icons.cloud_circle,
          color: iconColor ?? AppColor.blackColor,
        ));
  }
}