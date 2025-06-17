
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          style: Styles.themeStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        BestSellerRating(),
        SizedBox(height: 37),
        BookActions(),
      ],
    );
  }
}
