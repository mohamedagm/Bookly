
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class SuggestedListView extends StatelessWidget {
  const SuggestedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return CustomBookCard();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
