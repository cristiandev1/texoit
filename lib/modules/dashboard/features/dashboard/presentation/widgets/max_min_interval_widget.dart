import 'package:flutter/material.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/max_min_producer_interval_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/widgets/build_data_table_interval_widget.dart';

class MaxMinIntervalWidget extends StatelessWidget {
  final List<ProducerIntervalEntity> min;
  final List<ProducerIntervalEntity> max;

  const MaxMinIntervalWidget({
    super.key,
    required this.min,
    required this.max,
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
                    'Producers with longest and shortest interval between wins',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    top: 24.0,
                  ),
                  child: Text(
                    'Maximum',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                BuildDataTableIntervalWidget(
                  width: width,
                  list: max,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24.0,
                    top: 24.0,
                  ),
                  child: Text(
                    'Minimum',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                BuildDataTableIntervalWidget(
                  width: width,
                  list: min,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
