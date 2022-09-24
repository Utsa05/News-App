import 'package:news_zone/data/core/api_client.dart';
import 'package:news_zone/data/core/api_constants.dart';
import 'package:news_zone/data/models/news_model.dart';
import 'package:news_zone/data/models/news_result_model.dart';

abstract class NewsRemoteDatasource {
  Future<List<NewsModel>> getNews();
  Future<List<NewsModel>> getNewsbyCountry(String countryName);
  Future<List<NewsModel>> getNewsbyCategory(String categoryName);
}

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final ApiClient apiClient;

  NewsRemoteDatasourceImpl({required this.apiClient});
  @override
  Future<List<NewsModel>> getNews() async {
    final response = await apiClient
        .get("top-headlines?category=business&apiKey=${ApiConstants.apiKey}");
    final news = NewResultModel.fromJson(response).news;
    return news!;
  }

  @override
  Future<List<NewsModel>> getNewsbyCountry(String country) async {
    final response = await apiClient
        .get("top-headlines?country=$country&apiKey=${ApiConstants.apiKey}");
    final news = NewResultModel.fromJson(response).news;
    return news!;
  }

  @override
  Future<List<NewsModel>> getNewsbyCategory(String categoryName) async {
    final response = await apiClient.get(
        "everything?q=$categoryName&from=2022-08-13&sortBy=popularity&apiKey=${ApiConstants.apiKey}");
    final news = NewResultModel.fromJson(response).news;
    return news!;
  }
}
