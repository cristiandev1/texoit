import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/interval_producers_usecase.dart';

import 'get_all_movies_usecase_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  IntervalProducersUsecase usecase =
      IntervalProducersUsecase(repository: mockDashboardRepository);

  final tResponse = MaxMinIntervalProducersResponse(min: [], max: []);

  test('should get interval producers data successfully from the repository',
      () async {
    when(mockDashboardRepository.getMaxMinWinIntervalForProducers()).thenAnswer(
      (_) => Future.value(
        Right(tResponse),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getMaxMinWinIntervalForProducers());
    expect(result, equals(Right(tResponse)));
  });

  final tFailure = Failure();

  test('should return a failure when repository fails to fetch data', () async {
    when(mockDashboardRepository.getMaxMinWinIntervalForProducers()).thenAnswer(
      (_) => Future.value(
        Left(tFailure),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getMaxMinWinIntervalForProducers());
    expect(result, equals(Left(tFailure)));
  });
}
