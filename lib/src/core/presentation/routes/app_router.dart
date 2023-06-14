import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: AuthorizationRoute.page, path: '/auth'),
        AutoRoute(page: StarredReposRoute.page, path: '/starred-repos'),
      ];
}
