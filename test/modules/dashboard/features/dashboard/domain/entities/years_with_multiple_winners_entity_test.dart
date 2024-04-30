import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/years_with_multiple_winners_entity.dart';

void main() {
  group('YearsWithMultipleWinnersEntity', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'year': 1999,
        'winnerCount': 3,
      };

      final result = YearsWithMultipleWinnersEntity.fromJson(json);

      expect(result.year, 1999);
      expect(result.winnerCount, 3);
    });

    test('should convert to JSON correctly', () {
      final entity = YearsWithMultipleWinnersEntity(
        year: 1999,
        winnerCount: 3,
      );

      final json = entity.toJson();

      expect(json['year'], 1999);
      expect(json['winnerCount'], 3);
    });
  });
}
