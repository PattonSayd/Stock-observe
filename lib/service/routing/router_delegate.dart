import 'package:flutter/material.dart';
import 'package:stock_observe/service/di/di.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';
import 'package:stock_observe/service/routing/page_builder.dart';
import 'package:stock_observe/service/routing/route_configuration.dart';
import 'package:stock_observe/service/routing/routes.dart';

class AppRouterDelegate extends RouterDelegate<RouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  final pages = <Page>[];

  PageBuilder get pageBuilder => Di.get();

  @override
  RouteConfiguration? currentConfiguration = RouteConfiguration.empty(
      initialPath: Routes.root, routeName: Routes.root);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        pageBuilder.buildUnAnimatedPage(
            const Scaffold(
              body: Center(
                child: Text('Home'),
              ),
            ),
            name: Routes.root),
        ...pages,
      ],
      onPopPage: (route, result) {
        if (route.didPop(result) == false) {
          return false;
        }

        pages.removeLast();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    Logs.debug('setNewRoutePath: $configuration');

    currentConfiguration = configuration;
    final String routeName = configuration.routeName;

    pages.clear();

    if (routeName == Routes.unknown) {
      Logs.warn('TODO: Open Unknown View');
    }

    notifyListeners();
  }
}
