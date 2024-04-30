import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class YearWithMultipleWinnersUsecase implements UseCase<YearsWithMultipleWinnersResponse, NoParams>{
  final IDashboardRepository repository;

  YearWithMultipleWinnersUsecase({required this.repository});

  @override
  Future<Either<Failure, YearsWithMultipleWinnersResponse>> call([NoParams? params]) async => await repository.getYearsWithMultipleWinners();
}