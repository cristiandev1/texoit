import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements IDashboardRepository {
  final IDashboardNetworkDatasource networkDatasource;

  DashboardRepositoryImpl({required this.networkDatasource});

  @override
  Future<Either<Failure, GetAllMoviesResponse>> getAllMovies({
    required int page,
    required int size,
    bool? winner,
    required int year,
  }) async =>
      await networkDatasource.getAllMovies(
        page: page,
        size: size,
        winner: winner,
        year: year,
      );

  @override
  Future<Either<Failure, MaxMinIntervalProducersResponse>>
      getMaxMinWinIntervalForProducers() async =>
          await networkDatasource.getMaxMinWinIntervalForProducers();

  @override
  Future<Either<Failure, MoviesByYearResponse>> getMoviesByYear(
          int year) async =>
      networkDatasource.getMoviesByYear(year);

  @override
  Future<Either<Failure, StudiosWithWinCountResponse>>
      getStudiosWithWinCount() async =>
          await networkDatasource.getStudiosWithWinCount();

  @override
  Future<Either<Failure, YearsWithMultipleWinnersResponse>>
      getYearsWithMultipleWinners() async =>
          await networkDatasource.getYearsWithMultipleWinners();
}
