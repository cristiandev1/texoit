class YearsWithMultipleWinnersEntity {
  final int year;
  final int winnerCount;

  YearsWithMultipleWinnersEntity({
    required this.year,
    required this.winnerCount,
  });

  factory YearsWithMultipleWinnersEntity.fromJson(Map<String, dynamic> json) {
    return YearsWithMultipleWinnersEntity(
      year: json['year'],
      winnerCount: json['winnerCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'winnerCount': winnerCount,
    };
  }
}
