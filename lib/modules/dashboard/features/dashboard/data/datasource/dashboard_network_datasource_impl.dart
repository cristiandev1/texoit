import 'package:dartz/dartz.dart';
import 'package:texoit/core/interfaces/network_service_interface.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/http_method_enum.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';

class DashboardNetworkDatasourceImpl implements IDashboardNetworkDatasource {
  final INetworkService networkService;

  DashboardNetworkDatasourceImpl(this.networkService);

  static const String _baseUrl =
      'https://tools.texoit.com/backend-java/api/movies';

  @override
  Future<Either<Failure, GetAllMoviesResponse>> getAllMovies({
    required int page,
    required int size,
    bool? winner,
    required int year,
  }) async {
    try {
      // final response = await networkService.request(
      //   url: '$_baseUrl?page=$page&size=$size&winner=$winner&year=$year',
      //   method: HttpMethod.get,
      // );

      // if (response is Map) {
      //   final result = GetAllMoviesResponse.fromJson(Map<String,dynamic>.from(response));
      //   return Right(
      //     result,
      //   );
      // } else {
      //   return Left(Failure()..message = 'Failed to load dashboard data');
      // }

      await Future.delayed(const Duration(seconds: 1));

      ///  Criei o mock pois o endpoint nao estava retornando nenhum dado com nenhum parametro (29/04/2024)
      const jsonMock = <String, dynamic>{
        "content": [
          {
            "id": 1,
            "year": 1980,
            "title": "Movie Title 1",
            "studios": ["Studio Name 1"],
            "producers": ["Producer Name 1"],
            "winner": true
          },
          {
            "id": 2,
            "year": 1985,
            "title": "Movie Title 2",
            "studios": ["Studio Name 2"],
            "producers": ["Producer Name 2"],
            "winner": false
          },
          {
            "id": 3,
            "year": 1990,
            "title": "Movie Title 3",
            "studios": ["Studio Name 3", "Studio Name 4"],
            "producers": ["Producer Name 3"],
            "winner": true
          },
          {
            "id": 4,
            "year": 1995,
            "title": "Movie Title 4",
            "studios": ["Studio Name 5"],
            "producers": ["Producer Name 4"],
            "winner": false
          },
          {
            "id": 5,
            "year": 2000,
            "title": "Movie Title 5",
            "studios": ["Studio Name 6", "Studio Name 7"],
            "producers": ["Producer Name 5"],
            "winner": true
          },
          {
            "id": 6,
            "year": 2005,
            "title": "Movie Title 6",
            "studios": ["Studio Name 8"],
            "producers": ["Producer Name 6"],
            "winner": false
          },
          {
            "id": 7,
            "year": 2010,
            "title": "Movie Title 7",
            "studios": ["Studio Name 9", "Studio Name 10"],
            "producers": ["Producer Name 7"],
            "winner": true
          },
          {
            "id": 8,
            "year": 2015,
            "title": "Movie Title 8",
            "studios": ["Studio Name 11"],
            "producers": ["Producer Name 8"],
            "winner": false
          },
          {
            "id": 9,
            "year": 2020,
            "title": "Movie Title 9",
            "studios": ["Studio Name 12", "Studio Name 13"],
            "producers": ["Producer Name 9"],
            "winner": true
          },
          {
            "id": 10,
            "year": 2021,
            "title": "Movie Title 10",
            "studios": ["Studio Name 14"],
            "producers": ["Producer Name 10"],
            "winner": false
          },
          {
            "id": 11,
            "year": 2022,
            "title": "Movie Title 11",
            "studios": ["Studio Name 15"],
            "producers": ["Producer Name 11"],
            "winner": true
          },
          {
            "id": 12,
            "year": 2023,
            "title": "Movie Title 12",
            "studios": ["Studio Name 16"],
            "producers": ["Producer Name 12"],
            "winner": false
          },
          {
            "id": 13,
            "year": 2024,
            "title": "Movie Title 13",
            "studios": ["Studio Name 17"],
            "producers": ["Producer Name 13"],
            "winner": true
          },
          {
            "id": 14,
            "year": 2025,
            "title": "Movie Title 14",
            "studios": ["Studio Name 18"],
            "producers": ["Producer Name 14"],
            "winner": false
          },
          {
            "id": 15,
            "year": 2026,
            "title": "Movie Title 15",
            "studios": ["Studio Name 19"],
            "producers": ["Producer Name 15"],
            "winner": true
          }
        ],
        "pageable": {
          "sort": {"sorted": false, "unsorted": true},
          "pageSize": 10,
          "pageNumber": 0,
          "offset": 0,
          "paged": true,
          "unpaged": false
        },
        "totalElements": 15,
        "last": false,
        "totalPages": 2,
        "first": true,
        "sort": {"sorted": false, "unsorted": true},
        "number": 0,
        "numberOfElements": 10,
        "size": 10
      };

      final response = GetAllMoviesResponse.fromJson(jsonMock);

      return Right(
        response,
      );
    } catch (e) {
      return Left(Failure(message: 'Failed to load movies'));
    }
  }

  @override
  Future<Either<Failure, YearsWithMultipleWinnersResponse>>
      getYearsWithMultipleWinners() async {
    try {
      final response = await networkService.request(
        url: '$_baseUrl?projection=years-with-multiple-winners',
        method: HttpMethod.get,
      );

      if (response is Map) {
        final model = YearsWithMultipleWinnersResponse.fromJson(
          Map<String, dynamic>.from(response),
        );
        return Right(model);
      } else {
        return Left(Failure(message: 'Invalid response format'));
      }
    } catch (e) {
      return Left(Failure(
        message: 'Failed to load years with multiple winners',
      ));
    }
  }

  @override
  Future<Either<Failure, StudiosWithWinCountResponse>>
      getStudiosWithWinCount() async {
    try {
      final response = await networkService.request(
        url: '$_baseUrl?projection=studios-with-win-count',
        method: HttpMethod.get,
      );

      if (response is Map) {
        return Right(StudiosWithWinCountResponse.fromJson(
            Map<String, dynamic>.from(response)));
      } else {
        return Left(Failure(message: 'Invalid response format'));
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to load studios with win count'));
    }
  }

  @override
  Future<Either<Failure, MaxMinIntervalProducersResponse>>
      getMaxMinWinIntervalForProducers() async {
    try {
      final response = await networkService.request(
        url: '$_baseUrl?projection=max-min-win-interval-for-producers',
        method: HttpMethod.get,
      );

      if (response is Map) {
        final model = MaxMinIntervalProducersResponse.fromJson(
          Map<String, dynamic>.from(response),
        );
        return Right(model);
      } else {
        return Left(Failure(message: 'Invalid response format'));
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to load max-min win interval for producers'));
    }
  }

  @override
  Future<Either<Failure, MoviesByYearResponse>> getMoviesByYear(
      int year) async {
    try {
      final response = await networkService.request(
        url: '$_baseUrl?winner=true&year=$year',
        method: HttpMethod.get,
      );

      if (response is List) {
        return Right(
          MoviesByYearResponse.fromJson(
            Map<String, dynamic>.from(response.first),
          ),
        );
      } else {
        return Left(Failure(message: 'Invalid response format'));
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to load movies by year'));
    }
  }
}
