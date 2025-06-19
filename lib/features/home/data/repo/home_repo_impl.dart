import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerListViewBooks() {
    // TODO: implement fetchBestSellerListViewBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchHorizontalListViewBooks() {
    // TODO: implement fetchHorizontalListViewBooks
    throw UnimplementedError();
  }
  
}