import 'package:flutter/material.dart';
import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/textStyle.dart';

void showSuccessSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: appMainTextstyle(14, blueColor, FontWeight.w600),
    ),
    backgroundColor: greenColor,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showErrorSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: appMainTextstyle(14, blueColor, FontWeight.w600),
    ),
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
