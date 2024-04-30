

import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';

class NoParams {}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}