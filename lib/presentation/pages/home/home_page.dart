// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:news_zone/presentation/pages/home/components/home_appbar.dart';
import 'package:news_zone/presentation/pages/home/components/news_feed.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawer: const Drawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              const CustomAppBar(),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              NewsFeed(
               
              ),
              NewsFeed(
                
              ),
              Center(
                child: Icon(Icons.directions_bike),
              ),
              Center(
                child: Icon(Icons.directions_car),
              ),
              Center(
                child: Icon(Icons.directions_transit),
              ),
              Center(
                child: Icon(Icons.directions_bike),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
