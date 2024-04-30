abstract class MovieSearchEvent {}

class GetMovieByYear implements MovieSearchEvent {
  final int year;

  GetMovieByYear({required this.year});
}
