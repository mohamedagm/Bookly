import 'package:bookly/core/utils/functions/custom_url_launcher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          text: 'Free',
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
          textColor: Colors.black,
        ),
        CustomButton(
          onPressed: () async {
            await previewBook(context, bookEntity.previewLink!);
          },
          text: 'Fast Preview',
          backgroundColor: Color(0xffEF8262),
          borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
