import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';

void main() {
  group('ProducerIntervalEntity', () {
    test('should convert from JSON correctly', () {
      final Map<String, dynamic> json = {
        'producer': 'Example Producer',
        'interval': 5,
        'previousWin': 1990,
        'followingWin': 1995,
      };

      final result = ProducerIntervalEntity.fromJson(json);

      expect(result.producer, 'Example Producer');
      expect(result.interval, 5);
      expect(result.previousWin, 1990);
      expect(result.followingWin, 1995);
    });

    test('should convert to JSON correctly', () {
      final entity = ProducerIntervalEntity(
        producer: 'Example Producer',
        interval: 5,
        previousWin: 1990,
        followingWin: 1995,
      );

      final json = entity.toJson();

      expect(json['producer'], 'Example Producer');
      expect(json['interval'], 5);
      expect(json['previousWin'], 1990);
      expect(json['followingWin'], 1995);
    });
  });
}
