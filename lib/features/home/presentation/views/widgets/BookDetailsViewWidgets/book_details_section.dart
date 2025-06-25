import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/Manager/SimilarBooks/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/books_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_actions.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        final BookModel bookModel =
            GoRouterState.of(context).extra as BookModel;
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
            BookActions(),
          ],
        );
      },
    );
  }
}
