import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/books_list_view_item.dart';
import 'package:bookly/core/widgets/vertical_books_shimmer.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/presentation/Manager/NewestBooks/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key});

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  List<BookEntity> books = [];
  final Set<String> _seenIds = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          for (final book in state.books) {
            if (book.bookId != null && _seenIds.add(book.bookId!)) {
              books.add(book);
            }
          }
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksLoadingPagination) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return BooksListViewItem(bookEntity: books[index]);
            }, childCount: books.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomError(error: state.errMessage),
          );
        } else {
          return SliverToBoxAdapter(child: VerticalBooksShimmer());
        }
      },
    );
  }
}
