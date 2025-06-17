import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_list_view.dart';
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.65,
                    child: CustomBookCard(),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'The Jungle Book',
                    style: Styles.themeStyle.copyWith(fontSize: 30),
                  ),
                  Text(
                    'Rudyard Kipling',
                    style: Styles.themeStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  BestSellerRating(),
                  SizedBox(height: 37),
                  BookActions(),
                  SizedBox(height: 47),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      style: Styles.themeStyle.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                  SuggestedListView(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
