import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_observe/service/di/di.dart';

void main() {
  test('di service', () {
    Di.reg<BackButtonDispatcher>(() => RootBackButtonDispatcher());
    Di.get<BackButtonDispatcher>();
  });
}
