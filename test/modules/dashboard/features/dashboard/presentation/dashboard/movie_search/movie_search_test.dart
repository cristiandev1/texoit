import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/movies_by_year_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_state.dart';

import 'movie_search_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  MoviesByYearUsecase moviesByYearUsecase =
      MoviesByYearUsecase(repository: mockDashboardRepository);
  MovieSearchBloc movieSearchBloc =
      MovieSearchBloc(moviesByYearUsecase: moviesByYearUsecase);

  group('MovieSarch Bloc', () {
    test('Failure', () async {
      final tFailure = Failure(message: 'failure');

      when(
        moviesByYearUsecase.call(MoviesByYearParams(year: 1900)),
      ).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      movieSearchBloc.add(GetMovieByYear(year: 1900));

      await expectLater(
        movieSearchBloc.stream,
        emitsInOrder([
          MovieSearchStateLoading(),
          MovieSearchStateFailure(message: tFailure.message),
        ]),
      );
    });

    test('MovieSearchStateSuccess', () async {
      final tResponse = MoviesByYearResponse(
        movie: MovieByYearEntity(
          id: 1,
          year: 1900,
          title: '',
          studios: [],
          producers: [],
          winner: true,
        ),
      );

      when(
        moviesByYearUsecase.call(MoviesByYearParams(year: 1900)),
      ).thenAnswer(
        (_) => Future.value(
          Right(tResponse),
        ),
      );

      movieSearchBloc.add(GetMovieByYear(year: 1900));

      await expectLater(
        movieSearchBloc.stream,
        emitsInOrder([
           MovieSearchStateLoading(),
           MovieSearchStateSuccess(data: tResponse.movie),
        ]),
      );
    });
  });
}
