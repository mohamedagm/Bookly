part of 'search_result_cubit.dart';

sealed class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultLoading extends SearchResultState {}

final class SearchResultSuccess extends SearchResultState {
  final List<BookModel> books;

  const SearchResultSuccess(this.books);
}

final class SearchResultFailure extends SearchResultState {
  final String errMessage;

  const SearchResultFailure(this.errMessage);
}
