import 'package:flutter/material.dart';
import 'package:news_zone/commons/route_constants.dart';
import 'package:news_zone/presentation/pages/home/home_page.dart';

class AppRoute {
 static Route onGerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteConts.initial:
        return MaterialPageRoute(builder: (builder) => const HomePage());
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

