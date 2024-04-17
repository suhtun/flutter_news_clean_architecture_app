import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pizza_app/core/resources/data_state.dart';
import 'package:pizza_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:pizza_app/features/daily_news/data/models/article.dart';
import 'package:pizza_app/features/daily_news/domain/entities/article.dart';
import 'package:pizza_app/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constants/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewArticles() async{
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey:newsAPIKey,
        country:countryQuery,
        category:categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

// @override
// Future<List<ArticleEntity>> getSavedArticles() {
//   // TODO: implement getSavedArticles
//   throw UnimplementedError();
// }
//
// @override
// Future<void> removeArticle(ArticleEntity articleEntity) {
//   // TODO: implement removeArticle
//   throw UnimplementedError();
// }
//
// @override
// Future<void> saveArticle(ArticleEntity articleEntity) {
//   // TODO: implement saveArticle
//   throw UnimplementedError();
// }
}
