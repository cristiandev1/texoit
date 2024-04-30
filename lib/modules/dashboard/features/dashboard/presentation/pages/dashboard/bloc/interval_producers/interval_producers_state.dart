import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';

abstract class IntervalProducersState {}

class IntervalProducersStateEmpty implements IntervalProducersState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is IntervalProducersStateEmpty;
}

class IntervalProducersStateLoading implements IntervalProducersState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is IntervalProducersStateLoading;
}

class IntervalProducersStateFailure implements IntervalProducersState {
  final String? message;

  IntervalProducersStateFailure({required this.message});

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      other is IntervalProducersStateFailure && message == other.message;
}

class IntervalProducersStateSuccess implements IntervalProducersState {
  final List<ProducerIntervalEntity> min;
  final List<ProducerIntervalEntity> max;

  IntervalProducersStateSuccess({required this.min, required this.max});

  @override
  int get hashCode => Object.hashAll([min, max]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IntervalProducersStateSuccess &&
        min == other.min &&
        max == other.max;
  }
}
