import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/enitities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;
  FetchSimilarBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call([String? category]) async {
    return await homeRepo.fetchSimilarBooks(category: category ?? '');
  }
}
