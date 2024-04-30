import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/year_with_multiple_winners_usecase.dart';

import 'year_with_multiple_winners_usecase_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  YearWithMultipleWinnersUsecase usecase =
      YearWithMultipleWinnersUsecase(repository: mockDashboardRepository);

  final tYearsWithMultipleWinnersResponse =
      YearsWithMultipleWinnersResponse(years: []);

  test(
      'should get years with multiple winners successfully from the repository',
      () async {
    when(mockDashboardRepository.getYearsWithMultipleWinners()).thenAnswer(
      (_) => Future.value(
        Right(tYearsWithMultipleWinnersResponse),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getYearsWithMultipleWinners());
    expect(result, equals(Right(tYearsWithMultipleWinnersResponse)));
  });

  test('should return a failure when repository fails to fetch data', () async {
    final tFailure = Failure();

    when(mockDashboardRepository.getYearsWithMultipleWinners()).thenAnswer(
      (_) => Future.value(
        Left(tFailure),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getYearsWithMultipleWinners());
    expect(result, equals(Left(tFailure)));
  });
}
