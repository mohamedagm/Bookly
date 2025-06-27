import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/horizontal_books_shimmer.dart';
import 'package:bookly/features/home/presentation/Manager/SimilarBooks/similar_books_cubit.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuggestedListView extends StatelessWidget {
  const SuggestedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child: ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push('/bookDetailsView', extra: state.books[index]);
                  },
                  child: BookImageCard(
                    imageLink:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomError(error: state.errMessage);
        } else {
          return HorizontalBooksShimmer(heightRatio: 0.16);
        }
      },
    );
  }
}
