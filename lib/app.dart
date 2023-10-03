import 'package:flutter/material.dart';
import 'service/di/di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationParser: Di.get<RouteInformationParser<Object>>(),
      routerDelegate: Di.get<RouterDelegate<Object>>(),
      backButtonDispatcher: Di.get<BackButtonDispatcher>(),
    );
  }
}
