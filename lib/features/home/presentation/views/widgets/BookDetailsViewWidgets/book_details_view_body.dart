import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/custom_book_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/suggested_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    // good refactoring point not mentioned
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomBookAppBar(),
                  SizedBox(height: 30),
                  BookDetailsSection(bookModel: bookModel),
                  Expanded(child: SizedBox(height: 47)),
                  SuggestedBooksSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
