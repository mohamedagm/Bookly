part of 'horizontal_books_cubit.dart';

sealed class HorizontalBooksState extends Equatable {
  const HorizontalBooksState();

  @override
  List<Object> get props => [];
}

final class HorizontalBooksInitial extends HorizontalBooksState {}

final class HorizontalBooksLoading extends HorizontalBooksState {}

final class HorizontalBooksSuccess extends HorizontalBooksState {
  final List<BookModel> books;

  const HorizontalBooksSuccess(this.books);
}

final class HorizontalBooksFaliure extends HorizontalBooksState {
  final String errMessage;

  const HorizontalBooksFaliure(this.errMessage);
}
