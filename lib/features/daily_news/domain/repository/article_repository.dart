import 'package:pizza_app/features/daily_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewArticles();

// Future<List<ArticleEntity>> getSavedArticles();

// Future<void> saveArticle(ArticleEntity articleEntity);

// Future<void> removeArticle(ArticleEntity articleEntity);
}
