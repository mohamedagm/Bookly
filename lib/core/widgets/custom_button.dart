import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    required this.text,
    this.onPressed,
  });
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          onPressed: onPressed,
          child: Text(text, style: Styles.style20.copyWith(color: textColor)),
        ),
      ),
    );
  }
}
