import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/studio_winners_usecase.dart';

import 'studio_winners_usecase_test.mocks.dart';

@GenerateMocks([IDashboardRepository])
void main() {
  IDashboardRepository mockDashboardRepository = MockIDashboardRepository();
  StudioWinnersUsecase usecase =
      StudioWinnersUsecase(repository: mockDashboardRepository);

  final tStudiosWithWinCountResponse = StudiosWithWinCountResponse(studios: []);

  test('should get studios with win count successfully from the repository',
      () async {
    when(mockDashboardRepository.getStudiosWithWinCount()).thenAnswer(
      (_) => Future.value(
        Right(tStudiosWithWinCountResponse),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getStudiosWithWinCount());
    expect(result, equals(Right(tStudiosWithWinCountResponse)));
  });

  final tFailure = Failure();

  test('should return a failure when repository fails to fetch data', () async {
    when(mockDashboardRepository.getStudiosWithWinCount()).thenAnswer(
      (_) => Future.value(
        Left(tFailure),
      ),
    );

    final result = await usecase();

    verify(mockDashboardRepository.getStudiosWithWinCount());
    expect(result, equals(Left(tFailure)));
  });
}
