import 'package:flutter_test/flutter_test.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/models/max_min_interval_producers_response.dart';

void main() {
  group('MaxMinIntervalProducersResponse', () {
    test('should convert from JSON correctly', () {
      
      final Map<String, dynamic> json = {
        'min': [
          {'producer': 'Producer A', 'interval': 3, 'previousWin': 1990, 'followingWin': 1993},
          {'producer': 'Producer B', 'interval': 5, 'previousWin': 1985, 'followingWin': 1990}
        ],
        'max': [
          {'producer': 'Producer C', 'interval': 10, 'previousWin': 1980, 'followingWin': 1990},
          {'producer': 'Producer D', 'interval': 12, 'previousWin': 1978, 'followingWin': 1990}
        ]
      };

      
      final result = MaxMinIntervalProducersResponse.fromJson(json);

      
      expect(result.min.length, 2);
      expect(result.max.length, 2);
      expect(result.min[0].producer, 'Producer A');
      expect(result.max[1].producer, 'Producer D');
    });

    test('should convert to JSON correctly', () {
      
      final response = MaxMinIntervalProducersResponse(
        min: [
          ProducerIntervalEntity(producer: 'Producer A', interval: 3, previousWin: 1990, followingWin: 1993),
          ProducerIntervalEntity(producer: 'Producer B', interval: 5, previousWin: 1985, followingWin: 1990)
        ],
        max: [
          ProducerIntervalEntity(producer: 'Producer C', interval: 10, previousWin: 1980, followingWin: 1990),
          ProducerIntervalEntity(producer: 'Producer D', interval: 12, previousWin: 1978, followingWin: 1990)
        ]
      );

      
      final json = response.toJson();

      
      expect(json['min'][0]['producer'], 'Producer A');
      expect(json['max'][1]['producer'], 'Producer D');
    });
  });
}
