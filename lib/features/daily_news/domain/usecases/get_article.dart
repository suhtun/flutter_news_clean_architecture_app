import 'dart:ffi';

import 'package:pizza_app/core/resources/data_state.dart';
import 'package:pizza_app/core/usecases/usecase.dart';
import 'package:pizza_app/features/daily_news/domain/repository/article_repository.dart';

import '../entities/article.dart';

class GetArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewArticles();
  }
}
