import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/daily_news/presentation/pages/home/daily_news.dart';

class AppRoutes{
  static Route onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(const DailyNews());
        // return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const DailyNews());
        // return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}