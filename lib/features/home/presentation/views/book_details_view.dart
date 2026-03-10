import 'package:bookly/core/utils/setup_service_locator.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/features/home/presentation/Manager/SimilarBooks/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/BookDetailsViewWidgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookEntity bookEntity = GoRouterState.of(context).extra as BookEntity;
    return BlocProvider(
      create:
          (context) =>
              SimilarBooksCubit(getIt.get<FetchSimilarBooksUseCase>())
                ..fetchSimilarBooksC(category: bookEntity.bookId ?? 'unknown'),
      child: Scaffold(body: BookDetailsViewBody(bookEntity: bookEntity)),
    );
  }
}
