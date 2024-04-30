import 'package:texoit/modules/dashboard/features/dashboard/data/models/years_with_multiple_winners_response.dart';

abstract class WinCountState {}

class YearsWithMultipleWinnersEmpty implements WinCountState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is YearsWithMultipleWinnersEmpty;
}

class YearsWithMultipleWinnersLoading implements WinCountState {
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) => other is YearsWithMultipleWinnersLoading;
}

class YearsWithMultipleWinnersFailure implements WinCountState {
  final String? message;

  YearsWithMultipleWinnersFailure({required this.message});

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) =>
      other is YearsWithMultipleWinnersFailure && message == other.message;
}

class YearsWithMultipleWinnersSuccess implements WinCountState {
  final YearsWithMultipleWinnersResponse data;

  YearsWithMultipleWinnersSuccess({required this.data});

  @override
  int get hashCode => Object.hashAll([data]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is YearsWithMultipleWinnersSuccess && data == other.data;
  }
}
