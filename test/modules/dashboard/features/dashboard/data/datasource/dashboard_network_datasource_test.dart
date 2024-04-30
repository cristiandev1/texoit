import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource_impl.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';

import 'dashboard_network_datasource_test.mocks.dart';

@GenerateMocks([DashboardNetworkDatasourceImpl])
void main() {
  DashboardNetworkDatasourceImpl mockDatasource =
      MockDashboardNetworkDatasourceImpl();

  group('All tests', () {
    const int tPage = 1;
    const int tSize = 10;
    const int tYear = 2024;
    const bool tWinner = true;

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

    test('should perform a call to getAllMovies with correct parameters',
        () async {
      when(mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      )).thenAnswer(
        (_) => Future.value(Right(tMoviesResponse)),
      );

      final result = await mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      );

      verify(mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      ));

      expect(result, Right(tMoviesResponse));
    });

    test('should perform a call to getAllMovies with failure', () async {
      final Failure failure = Failure();

      when(mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      )).thenAnswer(
        (_) => Future.value(Left(failure)),
      );

      final result = await mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      );

      verify(mockDatasource.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      ));

      expect(result, Left(failure));
    });

    test(
        'should return data when the call to getYearsWithMultipleWinners is successful',
        () async {
      final tYearsWithMultipleWinnersResponse =
          YearsWithMultipleWinnersResponse(
        years: [],
      );

      when(mockDatasource.getYearsWithMultipleWinners()).thenAnswer(
        (_) => Future.value(
          Right(tYearsWithMultipleWinnersResponse),
        ),
      );

      final result = await mockDatasource.getYearsWithMultipleWinners();

      verify(mockDatasource.getYearsWithMultipleWinners());
      expect(result, Right(tYearsWithMultipleWinnersResponse));
    });

    test(
        'should return a failure when the call to getYearsWithMultipleWinners is unsuccessful',
        () async {
      final Failure failure = Failure();

      when(mockDatasource.getYearsWithMultipleWinners()).thenAnswer(
        (_) => Future.value(
          Left(failure),
        ),
      );

      final result = await mockDatasource.getYearsWithMultipleWinners();

      verify(mockDatasource.getYearsWithMultipleWinners());
      expect(result, Left(failure));
    });

    test(
        'should return data when the call to getStudiosWithWinCount is successful',
        () async {
      final tStudiosWithWinCountResponse =
          StudiosWithWinCountResponse(studios: []);

      when(mockDatasource.getStudiosWithWinCount()).thenAnswer(
        (_) => Future.value(
          Right(tStudiosWithWinCountResponse),
        ),
      );

      final result = await mockDatasource.getStudiosWithWinCount();

      verify(mockDatasource.getStudiosWithWinCount());
      expect(result, Right(tStudiosWithWinCountResponse));
    });

    test(
        'should return a failure when the call to getStudiosWithWinCount is unsuccessful',
        () async {
      final Failure failure = Failure();
      when(mockDatasource.getStudiosWithWinCount()).thenAnswer(
        (_) => Future.value(
          Left(failure),
        ),
      );

      final result = await mockDatasource.getStudiosWithWinCount();

      verify(mockDatasource.getStudiosWithWinCount());
      expect(result, Left(failure));
    });

    test(
        'should return data when the call to getMaxMinWinIntervalForProducers is successful',
        () async {
      final tMaxMinIntervalProducersResponse =
          MaxMinIntervalProducersResponse(min: [], max: []);
      when(mockDatasource.getMaxMinWinIntervalForProducers()).thenAnswer(
        (_) => Future.value(
          Right(tMaxMinIntervalProducersResponse),
        ),
      );

      final result = await mockDatasource.getMaxMinWinIntervalForProducers();

      verify(mockDatasource.getMaxMinWinIntervalForProducers());
      expect(result, Right(tMaxMinIntervalProducersResponse));
    });

    test(
        'should return a failure when the call to getMaxMinWinIntervalForProducers is unsuccessful',
        () async {
      final Failure failure = Failure();
      when(mockDatasource.getMaxMinWinIntervalForProducers()).thenAnswer(
        (_) => Future.value(
          Left(failure),
        ),
      );

      final result = await mockDatasource.getMaxMinWinIntervalForProducers();

      verify(mockDatasource.getMaxMinWinIntervalForProducers());
      expect(result, Left(failure));
    });

    test('should return data when the call to getMoviesByYear is successful',
        () async {
      const int tYear = 2022;
      final tMoviesByYearResponse = MoviesByYearResponse(
        movie: MovieByYearEntity(
          id: 0,
          year: 0,
          title: '',
          studios: [],
          producers: [],
          winner: true,
        ),
      );

      when(mockDatasource.getMoviesByYear(tYear)).thenAnswer(
        (_) => Future.value(
          Right(tMoviesByYearResponse),
        ),
      );

      final result = await mockDatasource.getMoviesByYear(tYear);

      verify(mockDatasource.getMoviesByYear(tYear));
      expect(result, Right(tMoviesByYearResponse));
    });
  });
}
