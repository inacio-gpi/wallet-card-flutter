import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class KeyboardUtil {
  static final KeyboardUtil _singleton = KeyboardUtil._internal();

  factory KeyboardUtil() {
    return _singleton;
  }

  KeyboardUtil._internal();

  static defaultDoneAction(BuildContext context) => KeyboardUtilItem(
      title: "Concluído",
      onPressed: () {
        FocusManager.instance.primaryFocus!.unfocus();
        KeyboardUtil().unsetActions();
      });

  KeyboardUtilItem? leftAction;
  KeyboardUtilItem? rightAction;

  void unsetActions() {
    KeyboardUtil().leftAction = null;
    KeyboardUtil().rightAction = null;
  }

  void setActions({
    required BuildContext context,
    TextInputType? keyboardType,
    KeyboardUtilItem? leftAction,
    KeyboardUtilItem? rightAction,
  }) {
    if (kDebugMode) {
      print(Platform.isIOS);
      print(keyboardType);
      print(leftAction);
      print(rightAction);
    }
    if (!Platform.isIOS || keyboardType != TextInputType.number) {
      KeyboardUtil().leftAction = null;
      KeyboardUtil().rightAction = null;
      return;
    }

    if (leftAction == null && rightAction == null) {
      KeyboardUtil().rightAction = KeyboardUtil.defaultDoneAction(context);
      return;
    }

    KeyboardUtil().leftAction = leftAction;
    KeyboardUtil().rightAction = rightAction;
  }
}

class KeyboardUtilItem {
  Widget? child;
  String? title;
  Function()? onPressed;

  KeyboardUtilItem({this.child, this.title, this.onPressed})
      : assert(child != null || title != null,
            "One of the two parameters child|title must be initialized");
}
