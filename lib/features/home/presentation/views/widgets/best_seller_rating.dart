import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F), size: 20),
        SizedBox(width: 6.3),
        Text(
          '4.6',
          style: Styles.themeStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 5),
        Text(
          '(2334)',
          style: Styles.themeStyle.copyWith(
            color: Color(0xff707070),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
