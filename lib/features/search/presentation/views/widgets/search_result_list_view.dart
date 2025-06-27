import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/books_list_view_item.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/vertical_books_shimmer.dart';
import 'package:bookly/features/search/presentation/Manager/SearchResult/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BooksListViewItem(bookModel: state.books[index]);
              },
            ),
          );
        } else if (state is SearchResultFailure) {
          return CustomError(error: state.errMessage);
        } else if (state is SearchResultLoading) {
          return VerticalBooksShimmer();
        } else {
          return Text('Start search now', style: Styles.style20);
        }
      },
    );
  }
}
