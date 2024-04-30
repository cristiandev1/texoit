import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/interval_producers_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_state.dart';

class IntervalProducersBloc
    extends Bloc<IntervalProducersEvent, IntervalProducersState> {
  final IntervalProducersUsecase intervalProducersUsecase;
  IntervalProducersBloc({
    required this.intervalProducersUsecase,
  }) : super(IntervalProducersStateEmpty()) {
    on<GetIntervalBetween>(_onEvent);
  }

  Future<void> _onEvent(
    GetIntervalBetween event,
    Emitter<IntervalProducersState> emit,
  ) async {
    emit(IntervalProducersStateLoading());

    final response = await intervalProducersUsecase();

    response.fold(
      (failure) => emit(
        IntervalProducersStateFailure(message: failure.message),
      ),
      (data) => emit(
        IntervalProducersStateSuccess(
          max: data.max,
          min: data.min,
        ),
      ),
    );
  }
}
