import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/studios_with_win_counts_response.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';

void main() {
  group('StudiosWithWinCountResponse', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'studios': [
          {'name': 'Studio A', 'winCount': 5},
          {'name': 'Studio B', 'winCount': 3}
        ]
      };

      final result = StudiosWithWinCountResponse.fromJson(json);

      expect(result.studios.length, 2);
      expect(result.studios[0].name, 'Studio A');
      expect(result.studios[0].winCount, 5);
      expect(result.studios[1].name, 'Studio B');
      expect(result.studios[1].winCount, 3);
    });

    test('should convert to JSON correctly', () {
      final response = StudiosWithWinCountResponse(studios: [
        StudioWithWinCountEntity(name: 'Studio A', winCount: 5),
        StudioWithWinCountEntity(name: 'Studio B', winCount: 3)
      ]);

      final json = response.toJson();

      expect(json['studios'].length, 2);
      expect(json['studios'][0]['name'], 'Studio A');
      expect(json['studios'][0]['winCount'], 5);
      expect(json['studios'][1]['name'], 'Studio B');
      expect(json['studios'][1]['winCount'], 3);
    });
  });
}
