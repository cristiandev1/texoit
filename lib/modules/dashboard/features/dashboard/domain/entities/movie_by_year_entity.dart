class MovieByYearEntity {
  final int id;
  final int year;
  final String title;
  final List<String> studios;
  final List<String> producers;
  final bool winner;

  MovieByYearEntity({
    required this.id,
    required this.year,
    required this.title,
    required this.studios,
    required this.producers,
    required this.winner,
  });

  factory MovieByYearEntity.fromJson(Map<String, dynamic> json) {
    return MovieByYearEntity(
      id: json['id'],
      year: json['year'],
      title: json['title'],
      studios: List<String>.from(json['studios']),
      producers: List<String>.from(json['producers'].map((name) => name.trim())),
      winner: json['winner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'year': year,
      'title': title,
      'studios': studios,
      'producers': producers,
      'winner': winner,
    };
  }
}