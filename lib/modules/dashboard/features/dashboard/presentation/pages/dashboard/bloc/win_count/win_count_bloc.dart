import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/year_with_multiple_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_state.dart';

class WinCountBloc
    extends Bloc<WinCountEvent, WinCountState> {
  final YearWithMultipleWinnersUsecase yearWithMultipleWinnersUsecase;
  WinCountBloc({
    required this.yearWithMultipleWinnersUsecase,
  }) : super(YearsWithMultipleWinnersEmpty()) {
    on<GetYearsWithMultipleWinnersEvent>(_onEvent);
  }

  Future<void> _onEvent(
    GetYearsWithMultipleWinnersEvent event,
    Emitter<WinCountState> emit,
  ) async {
    emit(YearsWithMultipleWinnersLoading());

    final response = await yearWithMultipleWinnersUsecase();

    response.fold(
      (failure) => emit(
        YearsWithMultipleWinnersFailure(message: failure.message),
      ),
      (data) => emit(
        YearsWithMultipleWinnersSuccess(data: data),
      ),
    );
  }
}
