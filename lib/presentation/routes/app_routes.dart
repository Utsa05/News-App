import 'package:flutter/material.dart';
import 'package:news_zone/commons/route_constants.dart';
import 'package:news_zone/presentation/pages/home/home_page.dart';
import 'package:news_zone/presentation/pages/new_view/new_view_page.dart';

class AppRoute {
  static Route onGerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteConts.initial:
        return MaterialPageRoute(builder: (builder) => const HomePage());
      case AppRouteConts.newsView:
        var newsUrl = settings.arguments as String;
        return MaterialPageRoute(
            builder: (builder) => NewsViewPage(
                  newsUrl: newsUrl,
                ));
      default:
        return errorRoute();
    }
  }
}

errorRoute() {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Error Route"),
    ),
  );
}
