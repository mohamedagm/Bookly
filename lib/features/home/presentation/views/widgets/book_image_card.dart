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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imageLink,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
            errorWidget:
                (context, url, error) => const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
