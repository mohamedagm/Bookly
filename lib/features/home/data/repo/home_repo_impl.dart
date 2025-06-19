import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/remote/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> //return newest not best seller ok.
  fetchBestSellerListViewBooks() async {
    try {
      Map<String, dynamic> data = await ApiService(Dio()).getBooks(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(FailuresTest());
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchHorizontalListViewBooks() {
    // TODO: implement fetchHorizontalListViewBooks
    throw UnimplementedError();
  }
}
