part of 'best_seller_books_cubit.dart';

sealed class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends BestSellerBooksState {}

final class BestSellerBooksLoading extends BestSellerBooksState {}

final class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BookModel> books;

  const BestSellerBooksSuccess(this.books);
}

final class BestSellerBooksFaliure extends BestSellerBooksState {
  final String errMessage;

  const BestSellerBooksFaliure(this.errMessage);
}
