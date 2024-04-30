import 'package:flutter/material.dart';
import 'package:texoit/core/di/dependency_injection.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_by_year_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_event.dart';

class MovieSearchWidget extends StatefulWidget {
  final MovieByYearEntity? data;
  const MovieSearchWidget({
    super.key,
    this.data,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MovieSearchWidgetState createState() => _MovieSearchWidgetState();
}

class _MovieSearchWidgetState extends State<MovieSearchWidget> {
  final TextEditingController _yearController = TextEditingController();

  final MovieSearchBloc movieSearchBloc = getIt.get<MovieSearchBloc>();

  void _searchMovieByYear() {
    if (_yearController.text.isNotEmpty) {
      movieSearchBloc.add(
        GetMovieByYear(
          year: int.parse(
            _yearController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
                    'List movie winners by year',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      TextField(
                        controller: _yearController,
                        decoration: const InputDecoration(
                          hintText: 'Search by year',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _searchMovieByYear,
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (widget.data != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Resultado:'),
                        const SizedBox(height: 5),
                        DataTable(
                          columnSpacing:
                              38, // Ajuste conforme necessário para o layout
                          columns: const [
                            DataColumn(label: Text('Id')),
                            DataColumn(label: Text('Year')),
                            DataColumn(label: Text('Title')),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text('${widget.data?.id}')),
                                DataCell(Text('${widget.data?.year}')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    child: Tooltip(
                                      message: '${widget.data?.title}',
                                      child: Text(
                                        '${widget.data?.title}',
                                        overflow: TextOverflow.visible,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
