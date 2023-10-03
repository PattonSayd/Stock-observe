import 'package:flutter/material.dart';
import 'package:stock_observe/service/di/di.dart';
import 'package:stock_observe/service/routing/page_builder.dart';
import 'package:stock_observe/service/routing/route_information_parser.dart';
import 'package:stock_observe/service/routing/router_delegate.dart';

void initDependencies() {
  Di.reg<BackButtonDispatcher>(() => RootBackButtonDispatcher());
  Di.reg<RouteInformationParser<Object>>(() => AppRouteInformationParser());
  Di.reg<RouterDelegate<Object>>(() => AppRouterDelegate());
  Di.reg(() => PageBuilder());
}
