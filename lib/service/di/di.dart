import 'package:flutter/material.dart';

class Di {
  const Di();

  // ex.
  // Di.reg<BackButtonDispatcher>(() => RootBackButtonDispatcher());

  // { BackButtonDispatcher : RootBackButtonDispatcher() }
  static final _dependencies = <String, dynamic>{};

  static final _builders = <String, ValueGetter<dynamic>>{};

  static String _generateDiCode<T>([String name = '']) => "$T$name";

  static void reg<T>(
    ValueGetter<T> builder, {
    String name = '',
    bool asBuilder = false,
  }) {
    // get type, ex. T -> BackButtonDispatcher
    final String code = _generateDiCode<T>(name);

    if (asBuilder) {
      _builders[code] = builder;
    } else {
      _dependencies[code] = builder();
    }
  }

  static T get<T>({String name = ''}) {
    // get type, ex. T -> BackButtonDispatcher
    final String code = _generateDiCode<T>(name);

    late T value;

    if (!_dependencies.containsKey(code) && !_builders.containsKey(code)) {
      throw Exception('Dependency for type $T with code $code not registered');
    } else if (_dependencies.containsKey(code)) {
      value = _dependencies[code];
    } else {
      value = _builders[code]!();
    }

    return value;
  }
}
