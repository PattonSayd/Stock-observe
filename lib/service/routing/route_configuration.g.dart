// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteConfiguration _$RouteConfigurationFromJson(Map<String, dynamic> json) =>
    RouteConfiguration(
      initialPath: json['initialPath'] as String,
      routeName: json['routeName'] as String,
      routeParams:
          RouteParams.fromJson(json['routeParams'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteConfigurationToJson(RouteConfiguration instance) =>
    <String, dynamic>{
      'initialPath': instance.initialPath,
      'routeName': instance.routeName,
      'routeParams': instance.routeParams,
    };
