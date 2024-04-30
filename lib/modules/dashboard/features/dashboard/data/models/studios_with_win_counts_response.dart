import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';

class StudiosWithWinCountResponse {
  final List<StudioWithWinCountEntity> studios;

  StudiosWithWinCountResponse({required this.studios});

  factory StudiosWithWinCountResponse.fromJson(Map<String, dynamic> json) {
    var list = json['studios'] as List;
    List<StudioWithWinCountEntity> studiosList =
        list.map((item) => StudioWithWinCountEntity.fromJson(item)).toList();
    return StudiosWithWinCountResponse(studios: studiosList);
  }

  Map<String, dynamic> toJson() {
    return {
      'studios': studios.map((studio) => studio.toJson()).toList(),
    };
  }
}
