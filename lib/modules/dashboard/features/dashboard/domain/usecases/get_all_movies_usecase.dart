import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetAllMoviesUsecase
    implements UseCase<GetAllMoviesResponse, DashboardParams> {
  final IDashboardRepository repository;

  GetAllMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, GetAllMoviesResponse>> call(
          DashboardParams params) async =>
      await repository.getAllMovies(
        page: params.page,
        size: params.size,
        winner: params.winner,
        year: params.year,
      );
}

class DashboardParams {
  final int page;
  final int size;
  final bool? winner;
  final int year;

  DashboardParams({
    required this.page,
    required this.size,
    this.winner,
    required this.year,
  });
}
