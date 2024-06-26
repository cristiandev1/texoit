// Mocks generated by Mockito 5.4.4 from annotations
// in texoit/test/modules/dashboard/features/dashboard/presentation/dashboard/movie_search/movie_search_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:texoit/core/utils/failure.dart' as _i5;
import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart'
    as _i6;
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart'
    as _i9;
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart'
    as _i10;
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart'
    as _i8;
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart'
    as _i7;
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IDashboardRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIDashboardRepository extends _i1.Mock
    implements _i3.IDashboardRepository {
  MockIDashboardRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.GetAllMoviesResponse>> getAllMovies({
    required int? page,
    required int? size,
    bool? winner,
    required int? year,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllMovies,
          [],
          {
            #page: page,
            #size: size,
            #winner: winner,
            #year: year,
          },
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.GetAllMoviesResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.GetAllMoviesResponse>(
          this,
          Invocation.method(
            #getAllMovies,
            [],
            {
              #page: page,
              #size: size,
              #winner: winner,
              #year: year,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.GetAllMoviesResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.YearsWithMultipleWinnersResponse>>
      getYearsWithMultipleWinners() => (super.noSuchMethod(
            Invocation.method(
              #getYearsWithMultipleWinners,
              [],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.Failure,
                    _i7.YearsWithMultipleWinnersResponse>>.value(_FakeEither_0<
                _i5.Failure, _i7.YearsWithMultipleWinnersResponse>(
              this,
              Invocation.method(
                #getYearsWithMultipleWinners,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i7.YearsWithMultipleWinnersResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.StudiosWithWinCountResponse>>
      getStudiosWithWinCount() => (super.noSuchMethod(
            Invocation.method(
              #getStudiosWithWinCount,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        _i8.StudiosWithWinCountResponse>>.value(
                _FakeEither_0<_i5.Failure, _i8.StudiosWithWinCountResponse>(
              this,
              Invocation.method(
                #getStudiosWithWinCount,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i8.StudiosWithWinCountResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.MaxMinIntervalProducersResponse>>
      getMaxMinWinIntervalForProducers() => (super.noSuchMethod(
            Invocation.method(
              #getMaxMinWinIntervalForProducers,
              [],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        _i9.MaxMinIntervalProducersResponse>>.value(
                _FakeEither_0<_i5.Failure, _i9.MaxMinIntervalProducersResponse>(
              this,
              Invocation.method(
                #getMaxMinWinIntervalForProducers,
                [],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, _i9.MaxMinIntervalProducersResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i10.MoviesByYearResponse>>
      getMoviesByYear(int? year) => (super.noSuchMethod(
            Invocation.method(
              #getMoviesByYear,
              [year],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, _i10.MoviesByYearResponse>>.value(
                _FakeEither_0<_i5.Failure, _i10.MoviesByYearResponse>(
              this,
              Invocation.method(
                #getMoviesByYear,
                [year],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i10.MoviesByYearResponse>>);
}
