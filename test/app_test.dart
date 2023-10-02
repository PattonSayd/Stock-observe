import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_observe/service/di/di.dart';
import 'package:stock_observe/service/routing/routes.dart';

void main() {
  test('DI service', () {
    Di.reg<BackButtonDispatcher>(() => RootBackButtonDispatcher());
    Di.get<BackButtonDispatcher>();
  });

  test('Get Route Configurate', () {
    const path = "/item/AAPL?interval=day";
    final routeConfig = Routes.getRouteConfiguration(path);
    if (kDebugMode) print({routeConfig.toString()});

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

    expect(routeConfig.routeName == '/item/:itemCode', true);
  });
}
