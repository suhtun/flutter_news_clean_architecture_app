import 'package:dio/dio.dart';

import 'features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'features/daily_news/data/repository/article_repository.dart';
import 'features/daily_news/domain/repository/article_repository.dart';
import 'features/daily_news/domain/usecases/get_article.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl(),)
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );

  // sl.registerSingleton<GetSavedArticleUseCase>(
  //     GetSavedArticleUseCase(sl())
  // );
  //
  // sl.registerSingleton<SaveArticleUseCase>(
  //     SaveArticleUseCase(sl())
  // );
  //
  // sl.registerSingleton<RemoveArticleUseCase>(
  //     RemoveArticleUseCase(sl())
  // );


  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
          ()=> RemoteArticlesBloc(sl())
  );

  // sl.registerFactory<LocalArticleBloc>(
  //         ()=> LocalArticleBloc(sl(),sl(),sl())
  // );
}