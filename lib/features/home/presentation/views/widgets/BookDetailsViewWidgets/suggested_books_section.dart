import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/suggested_list_view.dart';
import 'package:flutter/material.dart';

class SuggestedBooksSection extends StatelessWidget {
  const SuggestedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
