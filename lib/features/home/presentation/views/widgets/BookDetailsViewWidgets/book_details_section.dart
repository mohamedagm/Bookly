import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/books_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_actions.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.65,
          child: BookImageCard(
            imageLink: bookModel.volumeInfo!.imageLinks!.thumbnail!,
          ),
        ),
        SizedBox(height: 40),
        Text(
          bookModel.volumeInfo!.title!,
          style: Styles.themeStyle.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        Text(
          bookModel.volumeInfo!.authors?[0] ?? 'Unknown Author',
          style: Styles.themeStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        BooksRating(
          rating: bookModel.volumeInfo!.averageRating ?? 0,
          count: bookModel.volumeInfo!.ratingsCount ?? 0,
        ),
        SizedBox(height: 37),
        BookActions(bookModel: bookModel),
      ],
    );
  }
}
