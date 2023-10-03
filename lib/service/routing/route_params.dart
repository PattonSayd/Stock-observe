import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stock_observe/service/logs.dart/logs.dart';
import 'package:stock_observe/service/types/types.dart';

part 'route_params.g.dart';

@immutable
@JsonSerializable()
class RouteParams {
  final Json params;
  final Json query;

  const RouteParams({
    required this.params,
    required this.query,
  });

  factory RouteParams.fromJson(Json json) => _$RouteParamsFromJson(json);

  Json toJson() => _$RouteParamsToJson(this);

  @override
  String toString() => prettyJson(toJson());
}
