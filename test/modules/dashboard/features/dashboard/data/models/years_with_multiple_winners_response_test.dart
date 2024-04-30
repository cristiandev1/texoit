import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/years_with_multiple_winners_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';

void main() {
  group('YearsWithMultipleWinnersResponse', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'years': [
          {'year': 1990, 'winnerCount': 5},
          {'year': 1995, 'winnerCount': 3}
        ]
      };

      final result = YearsWithMultipleWinnersResponse.fromJson(json);

      expect(result.years.length, 2);
      expect(result.years[0].year, 1990);
      expect(result.years[0].winnerCount, 5);
      expect(result.years[1].year, 1995);
      expect(result.years[1].winnerCount, 3);
    });

    test('should convert to JSON correctly', () {
      final response = YearsWithMultipleWinnersResponse(years: [
        YearsWithMultipleWinnersEntity(year: 1990, winnerCount: 5),
        YearsWithMultipleWinnersEntity(year: 1995, winnerCount: 3)
      ]);

      final json = response.toJson();

      expect(json['years'].length, 2);
      expect(json['years'][0]['year'], 1990);
      expect(json['years'][0]['winnerCount'], 5);
      expect(json['years'][1]['year'], 1995);
      expect(json['years'][1]['winnerCount'], 3);
    });
  });
}
