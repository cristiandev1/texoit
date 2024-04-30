import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';

abstract class MovieSearchState {}

class MovieSearchStateEmpty implements MovieSearchState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is MovieSearchStateEmpty;
}

class MovieSearchStateLoading implements MovieSearchState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is MovieSearchStateLoading;
}

class MovieSearchStateFailure implements MovieSearchState {
  final String? message;

  MovieSearchStateFailure({required this.message});

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      other is MovieSearchStateFailure && message == other.message;
}

class MovieSearchStateSuccess implements MovieSearchState {
  final MovieByYearEntity data;

  MovieSearchStateSuccess({required this.data});

  @override
  int get hashCode => Object.hashAll([data]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieSearchStateSuccess && data == other.data;
  }
}
