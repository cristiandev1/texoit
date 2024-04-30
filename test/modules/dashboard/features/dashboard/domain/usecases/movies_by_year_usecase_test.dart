import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/movies_by_year_usecase.dart';

import 'movies_by_year_usecase_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  MoviesByYearUsecase usecase = MoviesByYearUsecase(
    repository: mockDashboardRepository,
  );

  const tYear = 2020;
  final tMoviesByYearResponse = MoviesByYearResponse(
    movie: MovieByYearEntity(
      id: 1,
      year: tYear,
      title: "Test Movie",
      studios: [],
      producers: [],
      winner: false,
    ),
  );
  final tParams = MoviesByYearParams(year: tYear);

  test('should get movies by year data successfully from the repository',
      () async {
    when(mockDashboardRepository.getMoviesByYear(tYear)).thenAnswer(
      (_) => Future.value(
        Right(tMoviesByYearResponse),
      ),
    );

    final result = await usecase(tParams);

    verify(mockDashboardRepository.getMoviesByYear(tYear));
    expect(result, equals(Right(tMoviesByYearResponse)));
  });

  final tFailure = Failure();

  test('should return a failure when repository fails to fetch data', () async {
    when(mockDashboardRepository.getMoviesByYear(tYear))
        .thenAnswer((_) async => Left(tFailure));

    final result = await usecase(tParams);

    verify(mockDashboardRepository.getMoviesByYear(tYear));
    expect(result, equals(Left(tFailure)));
  });
}
