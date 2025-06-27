import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalBooksShimmer extends StatelessWidget {
  const HorizontalBooksShimmer({super.key, required this.heightRatio});
  final double heightRatio;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightRatio,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
