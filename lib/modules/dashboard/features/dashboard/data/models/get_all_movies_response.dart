import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_entity.dart';

class GetAllMoviesResponse {
  final List<MovieEntity> content;
  final Pageable pageable;
  final int totalElements;
  final bool last;
  final int totalPages;
  final bool first;
  final Sort sort;
  final int number;
  final int numberOfElements;
  final int size;

  GetAllMoviesResponse({
    required this.content,
    required this.pageable,
    required this.totalElements,
    required this.last,
    required this.totalPages,
    required this.first,
    required this.sort,
    required this.number,
    required this.numberOfElements,
    required this.size,
  });

  factory GetAllMoviesResponse.fromJson(Map<String, dynamic> json) {
    return GetAllMoviesResponse(
      content: (json['content'] as List)
          .map((item) => MovieEntity.fromJson(item))
          .toList(),
      pageable: Pageable.fromJson(json['pageable']),
      totalElements: json['totalElements'] as int,
      last: json['last'] as bool,
      totalPages: json['totalPages'] as int,
      first: json['first'] as bool,
      sort: Sort.fromJson(json['sort']),
      number: json['number'] as int,
      numberOfElements: json['numberOfElements'] as int,
      size: json['size'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((movie) => movie.toJson()).toList(),
      'pageable': pageable.toJson(),
      'totalElements': totalElements,
      'last': last,
      'totalPages': totalPages,
      'first': first,
      'sort': sort.toJson(),
      'number': number,
      'numberOfElements': numberOfElements,
      'size': size,
    };
  }
}

class Pageable {
  final Sort sort;
  final int pageSize;
  final int pageNumber;
  final int offset;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.sort,
    required this.pageSize,
    required this.pageNumber,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: Sort.fromJson(json['sort']),
      pageSize: json['pageSize'] as int,
      pageNumber: json['pageNumber'] as int,
      offset: json['offset'] as int,
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sort': sort.toJson(),
      'pageSize': pageSize,
      'pageNumber': pageNumber,
      'offset': offset,
      'paged': paged,
      'unpaged': unpaged,
    };
  }
}

class Sort {
  final bool sorted;
  final bool unsorted;

  Sort({
    required this.sorted,
    required this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sorted': sorted,
      'unsorted': unsorted,
    };
  }
}
