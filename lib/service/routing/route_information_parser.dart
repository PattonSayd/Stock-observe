import 'package:flutter/material.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';

import 'route_configuration.dart';
import 'routes.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  @override
  Future<RouteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    Logs.debug('call: parseRouteInformation');
    return Future.sync(
        () => Routes.getRouteConfiguration(routeInformation.uri.path));
  }
}
