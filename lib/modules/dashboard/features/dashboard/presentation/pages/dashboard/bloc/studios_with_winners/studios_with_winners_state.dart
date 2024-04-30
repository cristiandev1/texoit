import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';

abstract class StudiosWithWinnersState {}

class StudiosWithWinnersStateEmpty implements StudiosWithWinnersState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is StudiosWithWinnersStateEmpty;
}

class StudiosWithWinnersStateLoading implements StudiosWithWinnersState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is StudiosWithWinnersStateLoading;
}

class StudiosWithWinnersStateFailure implements StudiosWithWinnersState {
  final String? message;

  StudiosWithWinnersStateFailure({required this.message});

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) => other is StudiosWithWinnersStateFailure && message == other.message;
}

class StudiosWithWinnersStateSuccess implements StudiosWithWinnersState {
  final List<StudioWithWinCountEntity> data;

  StudiosWithWinnersStateSuccess({required this.data});

  @override
  int get hashCode => Object.hashAll([data]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudiosWithWinnersStateSuccess && data == other.data;
  }
}