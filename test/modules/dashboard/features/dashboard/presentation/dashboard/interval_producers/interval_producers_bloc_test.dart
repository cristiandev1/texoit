import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/interval_producers_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_state.dart';

import 'interval_producers_bloc_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  IntervalProducersUsecase intervalProducersUsecase =
      IntervalProducersUsecase(repository: mockDashboardRepository);
  IntervalProducersBloc intervalProducersBloc =
      IntervalProducersBloc(intervalProducersUsecase: intervalProducersUsecase);

  group('IntervalProducersBloc', () {
    test('Failure State', () async {
      final tFailure = Failure(message: 'failure');

      when(
        intervalProducersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Left(tFailure),
        ),
      );

      intervalProducersBloc.add(GetIntervalBetween());

      await expectLater(
        intervalProducersBloc.stream,
        emitsInOrder([
          IntervalProducersStateLoading(),
          IntervalProducersStateFailure(message: tFailure.message),
        ]),
      );
    });

    test('IntervalProducersStateSuccess', () async {
      final tResponse = MaxMinIntervalProducersResponse(max: [], min: []);

      when(
        intervalProducersUsecase.call(),
      ).thenAnswer(
        (_) => Future.value(
          Right(tResponse),
        ),
      );

      intervalProducersBloc.add(GetIntervalBetween());

      await expectLater(
        intervalProducersBloc.stream,
        emitsInOrder([
          IntervalProducersStateLoading(),
          IntervalProducersStateSuccess(max: tResponse.max, min: tResponse.min),
        ]),
      );
    });
  });
}
