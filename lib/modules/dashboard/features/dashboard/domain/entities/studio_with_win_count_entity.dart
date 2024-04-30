class StudioWithWinCountEntity {
  final String name;
  final int winCount;

  StudioWithWinCountEntity({required this.name, required this.winCount});

  factory StudioWithWinCountEntity.fromJson(Map<String, dynamic> json) {
    return StudioWithWinCountEntity(
      name: json['name'],
      winCount: json['winCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'winCount': winCount,
    };
  }
}
