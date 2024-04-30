import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';

void main() {
  group('MovieByYearEntity', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'id': 1,
        'year': 2020,
        'title': 'Inception',
        'studios': ['Studio A', 'Studio B'],
        'producers': ['Producer A', ' Producer B '],
        'winner': true,
      };

      final result = MovieByYearEntity.fromJson(json);

      expect(result.id, 1);
      expect(result.year, 2020);
      expect(result.title, 'Inception');
      expect(result.studios, containsAll(['Studio A', 'Studio B']));
      expect(result.producers, containsAll(['Producer A', 'Producer B']));
      expect(result.winner, isTrue);
    });

    test('should convert to JSON correctly', () {
      final entity = MovieByYearEntity(
        id: 1,
        year: 2020,
        title: 'Inception',
        studios: ['Studio A', 'Studio B'],
        producers: ['Producer A', 'Producer B'],
        winner: true,
      );

      final json = entity.toJson();

      expect(json['id'], 1);
      expect(json['year'], 2020);
      expect(json['title'], 'Inception');
      expect(json['studios'], containsAll(['Studio A', 'Studio B']));
      expect(json['producers'], containsAll(['Producer A', 'Producer B']));
      expect(json['winner'], isTrue);
    });
  });
}
