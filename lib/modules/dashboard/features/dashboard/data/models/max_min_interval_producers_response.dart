import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';

class MaxMinIntervalProducersResponse {
  final List<ProducerIntervalEntity> min;
  final List<ProducerIntervalEntity> max;

  MaxMinIntervalProducersResponse({required this.min, required this.max});

  factory MaxMinIntervalProducersResponse.fromJson(Map<String, dynamic> json) {
    var minList = json['min'] as List;
    var maxList = json['max'] as List;
    List<ProducerIntervalEntity> minProducers =
        minList.map((item) => ProducerIntervalEntity.fromJson(item)).toList();
    List<ProducerIntervalEntity> maxProducers =
        maxList.map((item) => ProducerIntervalEntity.fromJson(item)).toList();
    return MaxMinIntervalProducersResponse(
        min: minProducers, max: maxProducers);
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min.map((minItem) => minItem.toJson()).toList(),
      'max': max.map((maxItem) => maxItem.toJson()).toList(),
    };
  }
}
