import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      if (cachedBooks.isNotEmpty) {
        return Right(cachedBooks);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      return Right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioEXception(e));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      if (cachedBooks.isNotEmpty) {
        return Right(cachedBooks);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioEXception(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchSimilarBooks(
        category: category,
      );
      if (cachedBooks.isNotEmpty) {
        return Right(cachedBooks);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchSimilarBooks(
        category: category,
      );
      return Right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioEXception(e));
    }
  }
}
