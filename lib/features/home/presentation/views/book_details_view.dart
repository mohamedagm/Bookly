import 'package:bookly/core/utils/setup_service_locator.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/Manager/SimilarBooks/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookModel bookModel = GoRouterState.of(context).extra as BookModel;
    return BlocProvider(
      create:
          (context) => SimilarBooksCubit(
            getIt<HomeRepoImpl>(),
          )..fetchSimilarBooksC(category: bookModel.volumeInfo!.categories![0]),
      child: Scaffold(body: BookDetailsViewBody()),
    );
  }
}
