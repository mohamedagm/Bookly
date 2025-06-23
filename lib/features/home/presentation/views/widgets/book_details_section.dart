import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image_card.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.65,
          child: BookImageCard(imageLink: ''),
        ),
        SizedBox(height: 40),
        Text(
          'The Jungle Book',
          style: Styles.themeStyle.copyWith(fontSize: 30),
        ),
        Text(
          'Rudyard Kipling',
          style: Styles.themeStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        BooksRating(rating: 4, count: 4),
        SizedBox(height: 37),
        BookActions(),
      ],
    );
  }
}
