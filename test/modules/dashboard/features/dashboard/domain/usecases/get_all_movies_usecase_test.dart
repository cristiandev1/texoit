import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/get_all_movies_usecase.dart';

import 'get_all_movies_usecase_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  GetAllMoviesUsecase usecase =
      GetAllMoviesUsecase(repository: mockDashboardRepository);

  const tPage = 1;
  const tSize = 10;
  const tYear = 2020;
  const tWinner = true;

  final tDashboardParams = DashboardParams(
    page: tPage,
    size: tSize,
    winner: tWinner,
    year: tYear,
  );

  final tMoviesResponse = GetAllMoviesResponse.fromJson({
    "content": [
      {
        "id": 1,
        "year": 1980,
        "title": "Movie Title 1",
        "studios": ["Studio Name 1"],
        "producers": ["Producer Name 1"],
        "winner": true
      },
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

  group('Get All Movies Usecase', () {
    test('should get movies from the repository', () async {
      when(mockDashboardRepository.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      )).thenAnswer(
        (_) => Future.value(
          Right(tMoviesResponse),
        ),
      );

      final result = await usecase(tDashboardParams);

      verify(
        mockDashboardRepository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      );

      expect(result, equals(Right(tMoviesResponse)));
    });

    test('should handle failure when repository fails to get movies', () async {
      final tFailure = Failure();
      when(mockDashboardRepository.getAllMovies(
        page: tPage,
        size: tSize,
        winner: tWinner,
        year: tYear,
      )).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      final result = await usecase(tDashboardParams);

      verify(
        mockDashboardRepository.getAllMovies(
          page: tPage,
          size: tSize,
          winner: tWinner,
          year: tYear,
        ),
      );
      expect(
        result,
        equals(
          Left(tFailure),
        ),
      );
    });
  });
}
