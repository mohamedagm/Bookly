import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

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
                  BookDetailsSection(),
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
