import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_params.g.dart';

typedef Json = Map<String, dynamic>;

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
  String toString() {
    return toJson().toString();
  }
}
