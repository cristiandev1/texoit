import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/movies_by_year_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final MoviesByYearUsecase moviesByYearUsecase;

  MovieSearchBloc({required this.moviesByYearUsecase})
      : super(MovieSearchStateEmpty()) {
    on<GetMovieByYear>(_onEvent);
  }

  Future<void> _onEvent(
    GetMovieByYear event,
    Emitter<MovieSearchState> emit,
  ) async {
    emit(MovieSearchStateLoading());

    final response = await moviesByYearUsecase(
      MoviesByYearParams(year: event.year),
    );

    response.fold(
      (failure) => emit(
        MovieSearchStateFailure(message: failure.message),
      ),
      (data) => emit(
        MovieSearchStateSuccess(data: data.movie),
      ),
    );
  }
}
