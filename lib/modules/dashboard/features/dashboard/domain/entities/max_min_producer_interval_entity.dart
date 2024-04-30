class ProducerIntervalEntity {
  final String producer;
  final int interval;
  final int previousWin;
  final int followingWin;
  

  ProducerIntervalEntity({
    required this.producer,
    required this.interval,
    required this.previousWin,
    required this.followingWin,
  });

  factory ProducerIntervalEntity.fromJson(Map<String, dynamic> json) {
    return ProducerIntervalEntity(
      producer: json['producer'],
      interval: json['interval'],
      previousWin: json['previousWin'],
      followingWin: json['followingWin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'producer': producer,
      'interval': interval,
      'previousWin': previousWin,
      'followingWin': followingWin,
    };
  }
}
