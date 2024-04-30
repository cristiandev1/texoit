import 'package:flutter/material.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';

class BuildDataTableIntervalWidget extends StatelessWidget {
  final List<ProducerIntervalEntity> list;
  final double width;
  const BuildDataTableIntervalWidget({
    super.key,
    required this.width,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width,
        ),
        child: DataTable(
          columnSpacing: width / 5,
          columns: const [
            DataColumn(label: Text('Producer')),
            DataColumn(label: Text('Interval')),
            DataColumn(label: Text('Previous Year')),
            DataColumn(label: Text('Following Year')),
          ],
          rows: (list)
              .map(
                (data) => DataRow(
                  cells: [
                    DataCell(Text(data.producer)),
                    DataCell(Text('${data.interval}')),
                    DataCell(Text('${data.previousWin}')),
                    DataCell(Text('${data.followingWin}')),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
