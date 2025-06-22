import 'package:flutter/material.dart';

class BookImageCard extends StatelessWidget {
  const BookImageCard({super.key, required this.imageLink});
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageLink),
            ),
          ),
        ),
      ),
    );
  }
}
