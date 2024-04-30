import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class IntervalProducersUsecase implements UseCase<MaxMinIntervalProducersResponse, NoParams>{
  final IDashboardRepository repository;

  IntervalProducersUsecase({required this.repository});

  @override
  Future<Either<Failure, MaxMinIntervalProducersResponse>> call([NoParams? params]) async => await repository.getMaxMinWinIntervalForProducers();
}