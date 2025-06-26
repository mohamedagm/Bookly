import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit() : super(SearchResultInitial());
}
