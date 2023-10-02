import 'package:flutter/material.dart';
import 'package:stock_observe/app.dart';
import 'package:stock_observe/service/di/registration.dart';

void main() {
  initDependencies();
  runApp(const App());
}
