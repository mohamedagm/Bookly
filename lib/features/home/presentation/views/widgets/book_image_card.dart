import 'package:cached_network_image/cached_network_image.dart';
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
        // مش لازمه هنا هااا يدوبك دي هنا عشان البوردر
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imageLink,
            fit: BoxFit.fill,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
