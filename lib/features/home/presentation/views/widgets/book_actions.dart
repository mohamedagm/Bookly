import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          text: '19.99€',
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
          textColor: Colors.black,
        ),
        CustomButton(
          text: 'Free Preview',
          backgroundColor: Color(0xffEF8262),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
