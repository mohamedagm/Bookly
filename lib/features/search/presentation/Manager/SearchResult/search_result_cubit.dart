import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchRepo, this.query) : super(SearchResultInitial());
  final SearchRepo searchRepo;
  final String query;
  fetchResultBooksC() async {
    emit(SearchResultLoading());

    var result = await searchRepo.fetchResultBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchResultFailure(failure.errMessage));
      },
      (books) {
        emit(SearchResultSuccess(books));
      },
    );
  }
}
