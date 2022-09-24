// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_zone/data/core/api_constants.dart';

class ApiClient {
  final Client client;

  ApiClient({required this.client});

  dynamic get(String path) async {
    final resposne = await client.get(Uri.parse("${ApiConstants.baseURL}$path"),
        headers: {"Content-Type": "application/json"});

    //print(resposne.body);

    if (resposne.statusCode == 200) {
      return jsonDecode(resposne.body);
    } else {
      throw Exception(resposne.reasonPhrase);
    }
  }
}
