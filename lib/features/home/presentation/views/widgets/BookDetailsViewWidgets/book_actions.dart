import 'package:bookly/core/utils/functions/custom_url_launcher.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key});

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
            final BookModel bookModel =
                GoRouterState.of(context).extra as BookModel;
            await previewBook(context, bookModel.volumeInfo!.previewLink!);
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
