import 'package:flutter/material.dart';

import 'route_configuration.dart';
import 'routes.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  @override
  Future<RouteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return Future.sync(
        () => Routes.getRouteConfiguration(routeInformation.uri.path));
  }
}
