import 'package:dartz/dartz.dart';
import 'package:texoit/core/utils/failure.dart';
import 'package:texoit/core/utils/usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';

class StudioWinnersUsecase implements UseCase<StudiosWithWinCountResponse, NoParams>{
  final IDashboardRepository repository;

  StudioWinnersUsecase({required this.repository});

  @override
  Future<Either<Failure, StudiosWithWinCountResponse>> call([NoParams? params]) async => await repository.getStudiosWithWinCount();
}