import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 130, child: HorizontalCard()),
        SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harry Potter and the Goblet of Fire',
                style: Styles.style20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'J.K. Rowling',
                style: Styles.themeStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              BestSellerRating(),
            ],
          ),
        ),
      ],
    );
  }
}
