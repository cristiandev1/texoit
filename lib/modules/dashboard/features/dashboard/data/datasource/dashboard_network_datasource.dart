import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';

abstract class IDashboardNetworkDatasource {
  Future<Either<Failure, GetAllMoviesResponse>> getAllMovies({
    required int page,
    required int size,
    bool? winner,
    required int year,
  });
  Future<Either<Failure, YearsWithMultipleWinnersResponse>> getYearsWithMultipleWinners();
  Future<Either<Failure, StudiosWithWinCountResponse>> getStudiosWithWinCount();
  Future<Either<Failure, MaxMinIntervalProducersResponse>> getMaxMinWinIntervalForProducers();
  Future<Either<Failure, MoviesByYearResponse>> getMoviesByYear(int year);
}
