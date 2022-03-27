import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastedStates { success, error, warning }
void showToast({
  required String msg,
  required state,
  ToastGravity gravity = ToastGravity.BOTTOM,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Color chooseToastColor(ToastedStates states) {
  switch (states) {
    case ToastedStates.success:
      return Colors.green;

    case ToastedStates.error:
      return Colors.red;

    case ToastedStates.warning:
      return Colors.amber;
  }
}
