import 'dart:convert';

import 'package:logger/logger.dart';

final _l = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

abstract class Logs {
  static void debug(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.d(_getJoinedArguments(p1, p2, p3));
  }

  static void info(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.i(_getJoinedArguments(p1, p2, p3));
  }

  static void warn(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.w(_getJoinedArguments(p1, p2, p3));
  }

  static void error(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.e(_getJoinedArguments(p1, p2, p3));
  }

  static void fatal(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.f(_getJoinedArguments(p1, p2, p3));
  }

  static void trace(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.t(_getJoinedArguments(p1, p2, p3));
  }

  static void pad(dynamic p1, [dynamic p2, dynamic p3]) {
    _l.d(_getJoinedArguments(p1, p2, p3));
  }
}

String _getJoinedArguments(dynamic p1, [dynamic p2, dynamic p3]) {
  String result = p1.toString();
  result += p2 == null ? '' : ' ${p2.toString()}';
  result += p3 == null ? '' : ' ${p3.toString()}';
  return result;
}

String prettyJson(Map<String, dynamic> json) {
  const JsonEncoder jsonEncoder = JsonEncoder.withIndent(' ');
  return jsonEncoder.convert(json);
}
