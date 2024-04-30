import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';

class MoviesByYearResponse {
  final MovieByYearEntity movie;

  MoviesByYearResponse({required this.movie});

  factory MoviesByYearResponse.fromJson(Map<String, dynamic> json) {
    return MoviesByYearResponse(
      movie: MovieByYearEntity.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movie': movie.toJson(),
    };
  }
}