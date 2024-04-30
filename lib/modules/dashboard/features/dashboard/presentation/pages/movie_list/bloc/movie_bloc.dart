import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/get_all_movies_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetAllMoviesUsecase getAllMoviesUsecase;
  MovieBloc({
    required this.getAllMoviesUsecase,
  }) : super(MovieStateEmpty()) {
    on<FetchMovies>(_onEvent);
  }

  Future<void> _onEvent(
    FetchMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieStateLoading());

    final response = await getAllMoviesUsecase(
      DashboardParams(
        page: event.page,
        size: event.size,
        year: event.year,
        winner: event.winner,
      ),
    );

    response.fold(
      (failure) => emit(
        MovieStateFailure(message: failure.message),
      ),
      (data) => emit(
        MovieStateSuccess(
          data: data,
        ),
      ),
    );
  }
}
