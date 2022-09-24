// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:news_zone/commons/size_constants.dart';
import 'package:news_zone/commons/translation_constants.dart';
import 'package:news_zone/presentation/themes/app_color.dart';
import 'package:news_zone/presentation/widgets/circle_button_widget.dart';
import 'package:news_zone/presentation/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 51,

      pinned: true,
      // floating: true,
      leading: CircularButtonWidget(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        icons: Icons.menu_outlined,
      ),

      expandedHeight: 100,
      backgroundColor: AppColor.whiteColor,
      title: TextWidget(
        title: AppConstants.appName,
        size: AppSize.dimen_20.sp,
      ),
      centerTitle: true,
      actions: [
        CircularButtonWidget(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          icons: Icons.search_outlined,
        )
      ],
      bottom: categoryBottom(context),
    );
  }

//categories
  PreferredSize categoryBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(2),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 37,
          child: ButtonsTabBar(
            backgroundColor: Colors.white,
            unselectedBackgroundColor: Colors.white,
            unselectedLabelStyle: TextStyle(
                color: AppColor.blackColor.withOpacity(0.5),
                fontSize: AppSize.dimen_16.sp),
            labelStyle: TextStyle(
                color: Colors.black,
                // fontWeight: FontWeight.bold,
                fontSize: AppSize.dimen_18.sp),
            tabs: const [
              Tab(
                text: "Your",
              ),
              Tab(
                text: "Business",
              ),
              Tab(
                text: "Economics",
              ),
              Tab(
                text: "Inocme",
              ),
              Tab(
                text: "World",
              ),
              Tab(
                text: "Transport",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
