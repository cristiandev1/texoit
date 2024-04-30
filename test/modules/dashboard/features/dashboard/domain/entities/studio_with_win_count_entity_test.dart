import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';

void main() {
  group('StudioWithWinCountEntity', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'name': 'Studio Ghibli',
        'winCount': 5,
      };

      final result = StudioWithWinCountEntity.fromJson(json);

      expect(result.name, 'Studio Ghibli');
      expect(result.winCount, 5);
    });

    test('should convert to JSON correctly', () {
      final entity = StudioWithWinCountEntity(
        name: 'Studio Ghibli',
        winCount: 5,
      );

      final json = entity.toJson();

      expect(json['name'], 'Studio Ghibli');
      expect(json['winCount'], 5);
    });
  });
}
