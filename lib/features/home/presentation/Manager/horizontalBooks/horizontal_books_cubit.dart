import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'horizontal_books_state.dart';

class HorizontalBooksCubit extends Cubit<HorizontalBooksState> {
  HorizontalBooksCubit(this.homeRepo) : super(HorizontalBooksInitial());
  final HomeRepo homeRepo;
  fetchHorizontalListViewBooks() async {
    emit(HorizontalBooksLoading());
    var result = await homeRepo.fetchHorizontalListViewBooks();
    result.fold(
      (faliure) {
        emit(HorizontalBooksFaliure(faliure.errMessage));
      },
      (books) {
        emit(HorizontalBooksSuccess(books));
      },
    );
  }
}
