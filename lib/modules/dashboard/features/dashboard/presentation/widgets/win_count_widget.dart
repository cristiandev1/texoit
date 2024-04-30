import 'package:flutter/material.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/years_with_multiple_winners_entity.dart';

class WinCountWidget extends StatelessWidget {
  final List<YearsWithMultipleWinnersEntity>  yearsData;
  const WinCountWidget({
    super.key,
    required this.yearsData,
  });

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
                    'List years with multiple winners',
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
                          width / 5, // Adjust the spacing based on the width
                      columns: const [
                        DataColumn(label: Text('Year')),
                        DataColumn(label: Text('Win Count')),
                      ],
                      rows: yearsData
                          .map(
                            (data) => DataRow(
                              cells: [
                                DataCell(Text('${data.year}')),
                                DataCell(Text('${data.winnerCount}')),
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
