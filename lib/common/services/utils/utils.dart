import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Utils {
  static Color colorPrimary = const Color(0xff428BFA);
  static Color nightColorPrimary = const Color(0xff1C1C1E);
  static Color colorAccent = const Color(0xffEB5757);
  static Color nightColorAccent = const Color(0xffEB5757);
  static Color defTextColor = const Color(0xff7F7F7F);
  static Color nightDefTextColor = const Color(0x99f5f8fa);
  static Color cardDefColor = const Color(0xffF7F9F8);
  static Color backColor = const Color(0xFFFBFBFB);
  static Color nightBackColor = const Color(0xffF5F5F5);
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}

void showSnack(GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey, String title) {
  final snackbar = SnackBar(
      content: Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 15,
    ),
  ));
  // scaffoldMessengerKey.currentState.hideSnackBar();
  scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
}

void kprint(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
