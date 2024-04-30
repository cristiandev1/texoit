import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/get_all_movies_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_state.dart';

import 'movie_bloc_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  GetAllMoviesUsecase getAllMoviesUsecase =
      GetAllMoviesUsecase(repository: mockDashboardRepository);
  MovieBloc movieBloc = MovieBloc(getAllMoviesUsecase: getAllMoviesUsecase);

  group('MovieBloc', () {
    test('Failure State', () async {
      final tFailure = Failure(message: 'failure');

      when(
        getAllMoviesUsecase.call(
          DashboardParams(
            page: 1,
            size: 1,
            year: 1900,
          ),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      movieBloc.add(FetchMovies(page: 1, size: 1, year: 1900));

      await expectLater(
        movieBloc.stream,
        emitsInOrder(
          [
            MovieStateLoading(),
            MovieStateFailure(message: tFailure.message),
          ],
        ),
      );
    });

    test('MovieStateSuccess', () async {
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

      when(
        getAllMoviesUsecase.call(
          DashboardParams(
            page: 1,
            size: 1,
            year: 1900,
          ),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Right(tMoviesResponse),
        ),
      );

      movieBloc.add(FetchMovies(page: 1, size: 1, year: 1900));

      await expectLater(
        movieBloc.stream,
        emitsInOrder(
          [
            MovieStateLoading(),
            MovieStateSuccess(data: tMoviesResponse),
          ],
        ),
      );
    });
  });
}
