import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/core/di/dependency_injection.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/entities/movie_entity.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_state.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final MovieBloc bloc = getIt.get<MovieBloc>();
  int currentPage = 0;
  final int itemsPerPage = 10;
  String yearFilter = '';
  bool showWinnersOnly = false;

  List<MovieEntity> paginateMovies({
    required List<MovieEntity> movies,
    required int page,
    required int size,
  }) {
    int startIndex = page * size;
    int endIndex = startIndex + size;
    return movies.sublist(
      startIndex,
      endIndex < movies.length ? endIndex : movies.length,
    );
  }

  @override
  void initState() {
    super.initState();
    bloc.add(
      FetchMovies(
        page: currentPage + 1,
        size: itemsPerPage,
        year: DateTime.now().year,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is MovieStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MovieStateFailure) {
            return Center(
              child: Text(
                state.message ?? 'Error loading data.',
              ),
            );
          }

          if (state is MovieStateSuccess) {
            List<MovieEntity> movies = state.data.content;
            List<MovieEntity> filteredMovies = movies.where((movie) {
              bool yearCondition = yearFilter.isEmpty ||
                  movie.year.toString().contains(yearFilter);
              bool winnerCondition = !showWinnersOnly || movie.winner;
              return yearCondition && winnerCondition;
            }).toList();

            List<MovieEntity> paginatedMovies = paginateMovies(
              movies: filteredMovies,
              page: currentPage,
              size: itemsPerPage,
            );

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: yearFilter),
                          decoration: InputDecoration(
                            labelText: 'Year',
                            hintText: 'Enter the movie year',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 10.0,
                            ),
                          ),
                          onChanged: (value) {
                            yearFilter = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              currentPage = 0;
                              bloc.add(
                                FetchMovies(
                                  page: 1,
                                  size: itemsPerPage,
                                  year: int.tryParse(yearFilter) ??
                                      DateTime.now().year,
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('Search'),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.restart_alt, color: Colors.grey[600]),
                        tooltip: 'Reset filter',
                        onPressed: () {
                          setState(() {
                            yearFilter = '';
                            TextEditingController().clear();
                            currentPage = 0;
                            bloc.add(
                              FetchMovies(
                                page: 1,
                                size: itemsPerPage,
                                year: DateTime.now().year,
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Only winners'),
                  value: showWinnersOnly,
                  onChanged: (value) {
                    setState(() {
                      showWinnersOnly = value ?? false;
                      bloc.add(
                        FetchMovies(
                          page: currentPage + 1,
                          size: itemsPerPage,
                          year: int.tryParse(yearFilter) ?? DateTime.now().year,
                        ),
                      );
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: paginatedMovies.length,
                    itemBuilder: (context, index) {
                      MovieEntity movie = paginatedMovies[index];
                      return ListTile(
                        title: Text(movie.title),
                        subtitle: Text('Year: ${movie.year}'),
                        trailing: movie.winner
                            ? const Icon(Icons.star, color: Colors.yellow)
                            : null,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: currentPage > 0
                          ? () {
                              setState(
                                () {
                                  currentPage--;
                                  bloc.add(
                                    FetchMovies(
                                      page: currentPage + 1,
                                      size: itemsPerPage,
                                      year: int.tryParse(yearFilter) ??
                                          DateTime.now().year,
                                    ),
                                  );
                                },
                              );
                            }
                          : null,
                    ),
                    Text('Page ${currentPage + 1}'),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: (currentPage + 1) * itemsPerPage <
                              filteredMovies.length
                          ? () {
                              setState(
                                () {
                                  currentPage++;
                                  bloc.add(
                                    FetchMovies(
                                      page: currentPage + 1,
                                      size: itemsPerPage,
                                      year: int.tryParse(yearFilter) ??
                                          DateTime.now().year,
                                    ),
                                  );
                                },
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
