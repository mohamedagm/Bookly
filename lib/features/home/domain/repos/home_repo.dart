import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  });
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
