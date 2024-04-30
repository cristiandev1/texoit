import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/studio_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_state.dart';

import 'studios_with_winners_bloc_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  StudioWinnersUsecase studioWinnersUsecase =
      StudioWinnersUsecase(repository: mockDashboardRepository);
  StudiosWithWinnersBloc studiosWithWinnersBloc =
      StudiosWithWinnersBloc(studioWinnersUsecase: studioWinnersUsecase);

  group('StudiosWithWinnersBloc', () {
    test('Failure State', () async {
      final tFailure = Failure(message: 'failure');

      when(
        studioWinnersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      studiosWithWinnersBloc.add(GetStudiosWithWinnersEvent());

      await expectLater(
        studiosWithWinnersBloc.stream,
        emitsInOrder([
          StudiosWithWinnersStateLoading(),
          StudiosWithWinnersStateFailure(message: tFailure.message),
        ]),
      );
    });

    test('StudiosWithWinnersStateSuccess', () async {
      final tResponse = StudiosWithWinCountResponse(studios: []);

      when(
        studioWinnersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Right(tResponse),
        ),
      );

      studiosWithWinnersBloc.add(GetStudiosWithWinnersEvent());

      await expectLater(
        studiosWithWinnersBloc.stream,
        emitsInOrder([
          StudiosWithWinnersStateLoading(),
          StudiosWithWinnersStateSuccess(data: tResponse.studios),
        ]),
      );
    });
  });
}
