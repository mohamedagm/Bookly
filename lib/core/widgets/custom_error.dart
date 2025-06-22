import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error, style: Styles.themeStyle));
  }
}
