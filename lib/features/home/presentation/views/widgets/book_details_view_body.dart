import 'package:bookly/features/home/presentation/views/widgets/custom_book_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          ],
        ),
      ),
    );
  }
}
