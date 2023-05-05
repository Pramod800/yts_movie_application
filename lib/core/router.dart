import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_application/core/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomePageRoute.page, path: '/'),
    AutoRoute(page: BookMarkedRoute.page, path: '/bookmarks'),
    AutoRoute(page: MovieDetailRoute.page, path: '/movieDetailRoute'),
  ];
}
