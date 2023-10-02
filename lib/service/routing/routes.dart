import 'package:stock_observe/service/routing/route_configuration.dart';
import 'package:stock_observe/service/routing/route_params.dart';

const String itemCode = 'itemCode';

abstract class Routes {
  static String get root => '/';

  static String get unknown => '/404';

  static String item(String itemCode) => '/item/$itemCode';

  static List<String> routeNames = [
    Routes.root,
    Routes.unknown,
    Routes.item(':$itemCode')
  ];

  // convert url path to configuration
  // urlPath = "/item/AAPL?interval=day"
  static RouteConfiguration getRouteConfiguration(String urlPath) {
    if (urlPath == Routes.root) {
      return RouteConfiguration.empty(
          initialPath: urlPath, routeName: Routes.root);
    }

    final Uri uri = Uri.parse(urlPath);
    final pathSegments = uri.pathSegments;

    if (pathSegments.isEmpty) {
      return RouteConfiguration.empty(
          initialPath: urlPath, routeName: Routes.unknown);
    }

    for (var routeName in routeNames) {
      final List<String> routeSegments =
          routeName.split('/').where((segment) => segment.isNotEmpty).toList();

      if (routeSegments.length != pathSegments.length) continue;

      bool isTargetPath = true;

      final params = <String, String>{};

      for (int i = 0; i < pathSegments.length; i++) {
        final String path = pathSegments[i];
        final String route = routeSegments[i];
        final bool dynamicPath = route.contains(':');

        if (route != path && !dynamicPath) {
          isTargetPath = false;
          break;
        } else if (dynamicPath) {
          params[route.replaceFirst(':', '')] = path;
        }
      }

      if (isTargetPath) {
        return RouteConfiguration(
          initialPath: urlPath,
          routeName: routeName,
          routeParams: RouteParams(
            params: params,
            query: uri.queryParameters,
          ),
        );
      }
    }
    return RouteConfiguration.empty(
        initialPath: urlPath, routeName: Routes.unknown);
  }
}

// output:

//   {
//   "initialPath": "/item/AAPL?interval=day",
//   "routeName": "/item/:itemCode",
//   "routeParams": {
//     "params": {
//       "itemCode": "AAPL"
//     },
//     "query": {
//       "interval": "day"
//     }
//   }
// }