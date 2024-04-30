import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/years_with_multiple_winners_entity.dart';

class YearsWithMultipleWinnersResponse {
  final List<YearsWithMultipleWinnersEntity> years;

  YearsWithMultipleWinnersResponse({required this.years});

  factory YearsWithMultipleWinnersResponse.fromJson(Map<String, dynamic> json) {
    var list = json['years'] as List;
    List<YearsWithMultipleWinnersEntity> yearsList = list.map((item) => YearsWithMultipleWinnersEntity.fromJson(item)).toList();
    return YearsWithMultipleWinnersResponse(years: yearsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'years': years.map((year) => year.toJson()).toList(),
    };
  }
}