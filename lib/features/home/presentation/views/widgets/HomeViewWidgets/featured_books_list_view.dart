import 'package:bookly/core/utils/functions/show_dialog.dart';
import 'package:bookly/core/widgets/book_image_card.dart';
import 'package:bookly/core/widgets/horizontal_books_shimmer.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/presentation/Manager/FeaturedBooks/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController scrollController;
  int pageNumber = 1;
  bool isLoading = false;
  List<BookEntity> books = [];
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(trackScroll);
    super.initState();
  }

  void trackScroll() {
    var currentScroll = scrollController.position.pixels;
    var maxScroll = scrollController.position.maxScrollExtent;

    if (currentScroll >= maxScroll * 0.7) {
      if (!isLoading) {
        isLoading = true;
        context.read<FeaturedBooksCubit>().fetchFeaturedBooksC(
          pageNumber: pageNumber++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksFailure) {
          showStylishDialog(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              controller: scrollController,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push('/bookDetailsView', extra: books[index]);
                  },
                  child: BookImageCard(
                    imageLink:
                        books[index].image ??
                        'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
            ),
          );
        } else {
          return HorizontalBooksShimmer(heightRatio: 0.26);
        }
      },
    );
  }
}
