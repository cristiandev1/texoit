import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/studio_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_state.dart';

class StudiosWithWinnersBloc
    extends Bloc<StudiosWithWinnersEvent, StudiosWithWinnersState> {
  final StudioWinnersUsecase studioWinnersUsecase;
  StudiosWithWinnersBloc({
    required this.studioWinnersUsecase,
  }) : super(StudiosWithWinnersStateEmpty()) {
    on<GetStudiosWithWinnersEvent>(_onEvent);
  }

  Future<void> _onEvent(
    GetStudiosWithWinnersEvent event,
    Emitter<StudiosWithWinnersState> emit,
  ) async {
    emit(StudiosWithWinnersStateLoading());

    final response = await studioWinnersUsecase();

    response.fold(
      (failure) => emit(
        StudiosWithWinnersStateFailure(message: failure.message),
      ),
      (data) => emit(
        StudiosWithWinnersStateSuccess(data: data.studios),
      ),
    );
  }
}
