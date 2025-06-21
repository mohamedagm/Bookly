import 'package:bookly/features/home/presentation/views/widgets/book_image_card.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return BookImageCard();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
