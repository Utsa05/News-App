// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_zone/commons/size_constants.dart';
import 'package:news_zone/presentation/themes/app_color.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key, this.title, this.color, this.size, this.line, this.weight})
      : super(key: key);
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  final int? line;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "Title",
      maxLines: line ?? 1000,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color ?? AppColor.blackColor,
          fontSize: size ?? AppSize.dimen_14.sp,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
