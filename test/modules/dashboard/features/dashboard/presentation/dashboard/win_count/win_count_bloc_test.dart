import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/year_with_multiple_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_state.dart';

import 'win_count_bloc_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  YearWithMultipleWinnersUsecase yearWithMultipleWinnersUsecase =
      YearWithMultipleWinnersUsecase(repository: mockDashboardRepository);
  WinCountBloc winCountBloc = WinCountBloc(
      yearWithMultipleWinnersUsecase: yearWithMultipleWinnersUsecase);

  group('WinCountBloc', () {
    test('Failure State', () async {
      final tFailure = Failure(message: 'failure');

      when(
        yearWithMultipleWinnersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      winCountBloc.add(GetYearsWithMultipleWinnersEvent());

      await expectLater(
        winCountBloc.stream,
        emitsInOrder([
          YearsWithMultipleWinnersLoading(),
          YearsWithMultipleWinnersFailure(message: tFailure.message),
        ]),
      );
    });

    test('YearsWithMultipleWinnersSuccess', () async {
      final tResponse = YearsWithMultipleWinnersResponse(years: []);

      when(
        yearWithMultipleWinnersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Right(tResponse),
        ),
      );

      winCountBloc.add(GetYearsWithMultipleWinnersEvent());

      await expectLater(
        winCountBloc.stream,
        emitsInOrder([
          YearsWithMultipleWinnersLoading(),
          YearsWithMultipleWinnersSuccess(data: tResponse),
        ]),
      );
    });
  });
}
