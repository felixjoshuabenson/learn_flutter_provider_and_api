import 'package:go_router/go_router.dart';
import 'package:learn_provider/main.dart';
import 'package:learn_provider/news_file.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MyHomePage(
          title: 'Flutter Demo Home Page',
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/news_file',
          builder: (context, state) {
            return const NewsFile();
          },
        ),
      ],
    ),
  ],
);
