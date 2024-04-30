class MovieEntity {
  final int id;
  final int year;
  final String title;
  final List<String> studios;
  final List<String> producers;
  final bool winner;

  MovieEntity({
    required this.id,
    required this.year,
    required this.title,
    required this.studios,
    required this.producers,
    required this.winner,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'] as int,
      year: json['year'] as int,
      title: json['title'] as String,
      studios: List<String>.from(json['studios'] as List),
      producers: List<String>.from(json['producers'] as List),
      winner: json['winner'] as bool,
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
