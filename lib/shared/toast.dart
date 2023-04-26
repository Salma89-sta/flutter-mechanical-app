import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  }

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text(content),
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    ),
    ), ));}}