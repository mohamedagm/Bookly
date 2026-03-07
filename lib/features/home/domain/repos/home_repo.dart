import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
