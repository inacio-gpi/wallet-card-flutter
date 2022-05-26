import 'package:flutter/material.dart';

class ContextUtil {
  static final ContextUtil _instance = ContextUtil._internal();
  BuildContext? context;

  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  factory ContextUtil() {
    return _instance;
  }

  ContextUtil._internal();

  Widget startApp(BuildContext context, Widget widget) {
    this.context = context;
    return widget;
  }
}
