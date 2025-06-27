import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/features/home/presentation/Manager/FeaturedBooks/featured_books_cubit.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:bookly/core/widgets/horizontal_books_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
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
                        state.books[index].volumeInfo!.imageLinks!.thumbnail ??
                        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomError(error: state.errMessage);
        } else {
          return HorizontalBooksShimmer(heightRatio: 0.26);
        }
      },
    );
  }
}
