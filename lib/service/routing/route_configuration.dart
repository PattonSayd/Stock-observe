import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stock_observe/service/logs.dart/logger.dart';
import 'package:stock_observe/service/routing/routes.dart';

import 'route_params.dart';

part 'route_configuration.g.dart';

@immutable
@JsonSerializable()
class RouteConfiguration {
  final String initialPath;
  final String routeName;
  final RouteParams routeParams;

  const RouteConfiguration({
    required this.initialPath,
    required this.routeName,
    required this.routeParams,
  });

  const RouteConfiguration.empty({
    required this.initialPath,
    required this.routeName,
  }) : routeParams = const RouteParams(
            params: <String, String>{}, query: <String, String>{});

  factory RouteConfiguration.unknown() {
    return RouteConfiguration.empty(
      initialPath: Routes.unknown,
      routeName: Routes.unknown,
    );
  }

  factory RouteConfiguration.fromJson(Json json) =>
      _$RouteConfigurationFromJson(json);

  Json toJson() => _$RouteConfigurationToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
