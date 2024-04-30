import 'package:flutter/material.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/studio_with_win_count_entity.dart';

class StudiosWinnerWidget extends StatelessWidget {
  final List<StudioWithWinCountEntity> studiosData;
  const StudiosWinnerWidget({super.key, required this.studiosData});

  @override
  Widget build(BuildContext context) {
   
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    top: 24.0,
                  ),
                  child: Text(
                    'Top 3 Studios with winners',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: width,
                    ),
                    child: DataTable(
                      columnSpacing:
                          width / 4, // Adjust the spacing based on the width
                      columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(
                            label: Text('Win Count')),
                      ],
                      rows: studiosData
                          .map(
                            (data) => DataRow(
                              cells: [
                                DataCell(Text(data.name)),
                                DataCell(Text('${data.winCount}')),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
