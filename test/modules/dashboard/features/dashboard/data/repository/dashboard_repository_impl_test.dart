import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource_impl.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/years_with_multiple_winners_entity.dart';

import './dashboard_repository_impl_test.mocks.dart';

@GenerateMocks([DashboardNetworkDatasourceImpl])
void main() {
  late DashboardRepositoryImpl repository;

  setUp(() {
    DashboardNetworkDatasourceImpl mockDatasource =
        MockDashboardNetworkDatasourceImpl();
    repository = DashboardRepositoryImpl(networkDatasource: mockDatasource);
  });

  group('Dashboard Repository Tests', () {
    final GetAllMoviesResponse tMoviesResponse = GetAllMoviesResponse.fromJson({
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
    });

    test('getAllMovies should retrieve data from datasource', () async {
      const int tPage = 1;
      const int tSize = 10;
      const int tYear = 2024;
      const bool tWinner = true;

      when(
        repository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      ).thenAnswer(
        (_) => Future.value(
          Right(tMoviesResponse),
        ),
      );

      final result = await repository.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      );

      verify(
        repository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      );
      expect(result, equals(Right(tMoviesResponse)));
    });

    test('getAllMovies should handle failure', () async {
      const int tPage = 1;
      const int tSize = 10;
      const int tYear = 2024;
      const bool tWinner = true;
      final tFailure = Failure();

      when(
        repository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      ).thenAnswer(
        (_) => Future.value(Left(tFailure)),
      );

      final result = await repository.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      );

      verify(
        repository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      );
      expect(result, equals(Left(tFailure)));
    });

    test('getMaxMinWinIntervalForProducers should retrieve data successfully',
        () async {
      final tMaxMinIntervalProducersResponse = MaxMinIntervalProducersResponse(
        min: [],
        max: [],
      );
      when(repository.getMaxMinWinIntervalForProducers()).thenAnswer(
        (_) => Future.value(
          Right(
            tMaxMinIntervalProducersResponse,
          ),
        ),
      );

      final result = await repository.getMaxMinWinIntervalForProducers();

      verify(repository.getMaxMinWinIntervalForProducers());
      expect(result, equals(Right(tMaxMinIntervalProducersResponse)));
    });

    test('getMaxMinWinIntervalForProducers should handle failure', () async {
      final tFailure = Failure();
      when(repository.getMaxMinWinIntervalForProducers()).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      final result = await repository.getMaxMinWinIntervalForProducers();

      verify(repository.getMaxMinWinIntervalForProducers());
      expect(result, equals(Left(tFailure)));
    });

    test('getMoviesByYear should retrieve data successfully', () async {
      const int tYear = 2024;
      final tMoviesByYearResponse = MoviesByYearResponse(
        movie: MovieByYearEntity(
          title: "Example Movie",
          year: tYear,
          winner: true,
          id: 1,
          studios: [],
          producers: [],
        ),
      );

      when(repository.getMoviesByYear(tYear)).thenAnswer(
        (_) => Future.value(
          Right(
            tMoviesByYearResponse,
          ),
        ),
      );

      final result = await repository.getMoviesByYear(tYear);

      verify(repository.getMoviesByYear(tYear));
      expect(result, equals(Right(tMoviesByYearResponse)));
    });

    test('getMoviesByYear should handle failure', () async {
      const int tYear = 2024;
      final tFailure = Failure();
      when(repository.getMoviesByYear(tYear)).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      final result = await repository.getMoviesByYear(tYear);

      verify(repository.getMoviesByYear(tYear));
      expect(result, equals(Left(tFailure)));
    });

    test('getStudiosWithWinCount should retrieve data successfully', () async {
      final tStudiosWithWinCountResponse = StudiosWithWinCountResponse(
        studios: [
          StudioWithWinCountEntity(name: "Studio A", winCount: 5),
          StudioWithWinCountEntity(name: "Studio B", winCount: 3)
        ],
      );

      when(repository.getStudiosWithWinCount()).thenAnswer(
        (_) => Future.value(
          Right(tStudiosWithWinCountResponse),
        ),
      );

      final result = await repository.getStudiosWithWinCount();

      verify(repository.getStudiosWithWinCount());
      expect(result, equals(Right(tStudiosWithWinCountResponse)));
    });

    test('getStudiosWithWinCount should handle failure', () async {
      final tFailure = Failure();

      when(repository.getStudiosWithWinCount()).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      final result = await repository.getStudiosWithWinCount();

      verify(repository.getStudiosWithWinCount());
      expect(result, equals(Left(tFailure)));
    });

    test('getYearsWithMultipleWinners should retrieve data successfully',
        () async {
      final tYearsWithMultipleWinnersResponse =
          YearsWithMultipleWinnersResponse(
        years: [
          YearsWithMultipleWinnersEntity(year: 1999, winnerCount: 3),
          YearsWithMultipleWinnersEntity(year: 2000, winnerCount: 2)
        ],
      );

      when(repository.getYearsWithMultipleWinners()).thenAnswer(
        (_) => Future.value(
          Right(tYearsWithMultipleWinnersResponse),
        ),
      );

      final result = await repository.getYearsWithMultipleWinners();

      verify(repository.getYearsWithMultipleWinners());
      expect(result, equals(Right(tYearsWithMultipleWinnersResponse)));
    });

    test('getYearsWithMultipleWinners should handle failure', () async {
      final tFailure = Failure();
      when(repository.getYearsWithMultipleWinners()).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      final result = await repository.getYearsWithMultipleWinners();

      verify(repository.getYearsWithMultipleWinners());
      expect(result, equals(Left(tFailure)));
    });
  });
}
