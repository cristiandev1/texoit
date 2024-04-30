abstract class MovieEvent {}

class FetchMovies extends MovieEvent {
  final int page;
  final int size;
  final bool? winner;
  final int year;

  FetchMovies({
    required this.page,
    required this.size,
    this.winner,
    required this.year,
  });
}


