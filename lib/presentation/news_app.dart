// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_zone/commons/route_constants.dart';

import 'package:news_zone/commons/translation_constants.dart';
import 'package:news_zone/di/get_it.dart';
import 'package:news_zone/presentation/cubits/loading_cubit/loading_cubit.dart';
import 'package:news_zone/presentation/cubits/news_cubit/news_cubit.dart';
import 'package:news_zone/presentation/routes/app_routes.dart';
import 'package:news_zone/presentation/themes/app_color.dart';
import 'package:news_zone/presentation/themes/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late LoadingCubit _loadingCubit;
  late NewsCubit _newsCubit;

  @override
  void initState() {
    _loadingCubit = getInstance<LoadingCubit>();
    _newsCubit = getInstance<NewsCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    _newsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: (context, widget) => MultiBlocProvider(
                providers: [
                  BlocProvider<LoadingCubit>.value(value: _loadingCubit),
                  BlocProvider<NewsCubit>.value(value: _newsCubit)
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: AppConstants.appName,
                  theme: ThemeData(
                      iconTheme:
                          const IconThemeData(color: AppColor.blackColor),
                      primaryColor: AppColor.pupleColor,
                      primarySwatch: AppColor.pupleColor,
                      scaffoldBackgroundColor: AppColor.whiteColor,
                      textTheme: AppTextStyle.lightTextTheme,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      appBarTheme: const AppBarTheme(elevation: 0.0)),
                  onGenerateRoute: AppRoute.onGerateRoute,
                  initialRoute: AppRouteConts.initial,
                )));
  }
}
