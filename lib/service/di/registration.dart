import 'package:flutter/material.dart';
import 'package:stock_observe/service/di/di.dart';

void initDependencies() {
  Di.reg<BackButtonDispatcher>(() => RootBackButtonDispatcher());
}
