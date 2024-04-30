import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/movies_by_year_response.dart';

void main() {
  group('MoviesByYearResponse', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        "id": 99,
        "year": 1990,
        "title": "Movie Title",
        "studios": ["Studio Name"],
        "producers": ["Producer Name"],
        "winner": true
      };

      final result = MoviesByYearResponse.fromJson(json);

      expect(result.movie.title, 'Movie Title');
      expect(result.movie.year, 1990);
      expect(result.movie.winner, true);
      expect(result.movie.id, 99);
      expect(result.movie.studios.first, "Studio Name");
      expect(result.movie.producers.first, "Producer Name");
    });

    test('should convert to JSON correctly', () {
      final response = MoviesByYearResponse(
        movie: MovieByYearEntity(
          title: 'Example Movie',
          year: 2021,
          winner: true,
          id: 1,
          studios: [],
          producers: [],
        ),
      );

      final json = response.toJson();

      expect(json['movie']['title'], 'Example Movie');
      expect(json['movie']['year'], 2021);
      expect(json['movie']['winner'], true);
      expect(json['movie']['id'], 1);
      expect(json['movie']['studios'], []);
      expect(json['movie']['producers'], []);
    });
  });
}
