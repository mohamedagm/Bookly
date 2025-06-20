import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;
  fetchHorizontalListViewBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetchBestSellerListViewBooks();
    result.fold(
      (faliure) {
        emit(BestSellerBooksFaliure(faliure.errMessage));
      },
      (books) {
        emit(BestSellerBooksSuccess(books));
      },
    );
  }
}
