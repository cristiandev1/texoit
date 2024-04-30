import 'package:texoit/modules/dashboard/features/dashboard/data/models/get_all_movies_response.dart';

abstract class MovieState {}

class MovieStateEmpty implements MovieState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MovieStateEmpty;

  @override
  int get hashCode => runtimeType.hashCode;
}

class MovieStateLoading implements MovieState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MovieStateLoading;

  @override
  int get hashCode => runtimeType.hashCode;
}

class MovieStateFailure implements MovieState {
  final String? message;

  MovieStateFailure({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieStateFailure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class MovieStateSuccess implements MovieState {
  final GetAllMoviesResponse data;

  MovieStateSuccess({
    required this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieStateSuccess &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}
