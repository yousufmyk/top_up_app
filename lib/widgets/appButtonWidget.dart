import 'package:flutter/material.dart';
import 'package:top_up/utils/appColors.dart';
import 'package:top_up/utils/textStyle.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.height,
    this.width,
  });
  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 30,
        width: width ?? 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: blueColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: appMainTextstyle(14, whiteColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
