import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchResultBooks({
    required String query,
  }) async {
    try {
      Map<String, dynamic> data = await apiService.getBooks(
        endPoint: 'volumes?Filtering=free-ebooks&q=$query',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEXception(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
