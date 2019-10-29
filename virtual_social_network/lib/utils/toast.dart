import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(BuildContext context, String text) {
  String t = text ?? "";
  Toast.show(t, context,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.BOTTOM,
      textColor: Colors.white,
      backgroundColor: Color(0xAA000000));
}
