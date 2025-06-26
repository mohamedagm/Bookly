import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> fetchResultBooks({
    required String query,
  });
}
