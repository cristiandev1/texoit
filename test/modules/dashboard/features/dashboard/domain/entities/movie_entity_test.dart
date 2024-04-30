import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_entity.dart';

void main() {
  group('MovieEntity', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'id': 1,
        'year': 2021,
        'title': 'Example Movie',
        'studios': ['Studio A', 'Studio B'],
        'producers': ['Producer A', 'Producer B'],
        'winner': true,
      };

      final result = MovieEntity.fromJson(json);

      expect(result.id, 1);
      expect(result.year, 2021);
      expect(result.title, 'Example Movie');
      expect(result.studios, ['Studio A', 'Studio B']);
      expect(result.producers, ['Producer A', 'Producer B']);
      expect(result.winner, isTrue);
    });

    test('should convert to JSON correctly', () {
      final entity = MovieEntity(
        id: 1,
        year: 2021,
        title: 'Example Movie',
        studios: ['Studio A', 'Studio B'],
        producers: ['Producer A', 'Producer B'],
        winner: true,
      );

      final json = entity.toJson();

      expect(json['id'], 1);
      expect(json['year'], 2021);
      expect(json['title'], 'Example Movie');
      expect(json['studios'], ['Studio A', 'Studio B']);
      expect(json['producers'], ['Producer A', 'Producer B']);
      expect(json['winner'], isTrue);
    });
  });
}
