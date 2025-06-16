import 'package:bookly/features/home/presentation/views/widgets/horizontal_card.dart';
import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return HorizontalCard();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
