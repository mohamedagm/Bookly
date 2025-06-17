import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/Book 1 Hightligh.png'),
            ),
          ),
        ),
      ),
    );
  }
}
