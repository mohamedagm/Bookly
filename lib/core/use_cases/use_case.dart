import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Param> {
  Future<Either<Failures, T>> call([Param? param]);
}

class NoParam {}
