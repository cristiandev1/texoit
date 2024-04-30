import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class MoviesByYearUsecase implements UseCase<MoviesByYearResponse, MoviesByYearParams> {
  final IDashboardRepository repository;

  MoviesByYearUsecase({required this.repository});

  @override
  Future<Either<Failure, MoviesByYearResponse>> call(MoviesByYearParams params) async =>
      await repository.getMoviesByYear(
        params.year,
      );
}

class MoviesByYearParams {
  final int year;

  MoviesByYearParams({required this.year});
}
