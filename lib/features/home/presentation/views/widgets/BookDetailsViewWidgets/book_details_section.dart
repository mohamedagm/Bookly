import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/books_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_actions.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.65,
          child: BookImageCard(imageLink: bookEntity.image!),
        ),
        SizedBox(height: 40),
        Text(
          bookEntity.title!,
          style: Styles.themeStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        Text(
          bookEntity.authors?[0] ?? 'Unknown Author',
          style: Styles.themeStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        BooksRating(
          rating: bookEntity.averageRating ?? 0,
          count: bookEntity.ratingCount ?? 0,
        ),
        SizedBox(height: 37),
        BookActions(bookEntity: bookEntity),
      ],
    );
  }
}
