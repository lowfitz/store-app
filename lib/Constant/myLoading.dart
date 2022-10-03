import 'package:flutter/material.dart';

class MyLoading {
  static bool shown = false;

  static show(
    BuildContext context, {
    bool fullScreen = true,
  }) {
    if (shown == false) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return WillPopScope(
              onWillPop: (() => Future.value(false)),
              child: fullScreen
                  ? loadingWidget()
                  : Dialog(
                      child: SizedBox(
                          width: 200, height: 200, child: loadingWidget())),
            );
          });

      shown = true;
    }
  }

  static Center loadingWidget() => Center(child: CircularProgressIndicator());

  static dismis(BuildContext context) {
    if (shown) {
      Navigator.pop(context);
      shown = false;
    } else {}
  }
}
