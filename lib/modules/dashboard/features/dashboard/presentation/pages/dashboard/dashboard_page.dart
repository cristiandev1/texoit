import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texoit/core/di/dependency_injection.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_state.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_state.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_state.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_event.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_state.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/widgets/max_min_interval_widget.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/widgets/movie_search_widget.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/widgets/studios_winner_widget.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/widgets/win_count_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final WinCountBloc winCountBloc = getIt.get<WinCountBloc>();
  final StudiosWithWinnersBloc studiosWithWinnersBloc =
      getIt.get<StudiosWithWinnersBloc>();
  final IntervalProducersBloc intervalProducersBloc =
      getIt.get<IntervalProducersBloc>();
  final MovieSearchBloc movieSearchBloc = getIt.get<MovieSearchBloc>();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    winCountBloc.add(GetYearsWithMultipleWinnersEvent());
    studiosWithWinnersBloc.add(GetStudiosWithWinnersEvent());
    intervalProducersBloc.add(GetIntervalBetween());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: RefreshIndicator(
          onRefresh: _getData,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<WinCountBloc, WinCountState>(
                  bloc: winCountBloc,
                  builder: (context, state) {
                    if (state is YearsWithMultipleWinnersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is YearsWithMultipleWinnersFailure) {
                      return Center(child: Text(state.message ?? ''));
                    }
                    if (state is YearsWithMultipleWinnersSuccess) {
                      return WinCountWidget(yearsData: state.data.years);
                    }

                    return const Center(child: Text('Win count is empty'));
                  },
                ),
                BlocBuilder<StudiosWithWinnersBloc, StudiosWithWinnersState>(
                  bloc: studiosWithWinnersBloc,
                  builder: (context, state) {
                    if (state is StudiosWithWinnersStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is StudiosWithWinnersStateFailure) {
                      return Center(child: Text(state.message ?? ''));
                    }
                    if (state is StudiosWithWinnersStateSuccess) {
                      return StudiosWinnerWidget(studiosData: state.data);
                    }

                    return const Center(child: Text('Studios is empty'));
                  },
                ),
                BlocBuilder<IntervalProducersBloc, IntervalProducersState>(
                  bloc: intervalProducersBloc,
                  builder: (context, state) {
                    if (state is IntervalProducersStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is IntervalProducersStateFailure) {
                      return Center(child: Text(state.message ?? ''));
                    }
                    if (state is IntervalProducersStateSuccess) {
                      return MaxMinIntervalWidget(
                        max: state.max,
                        min: state.min,
                      );
                    }

                    return const Center(child: Text('Interval is empty'));
                  },
                ),
                BlocBuilder<MovieSearchBloc, MovieSearchState>(
                  bloc: movieSearchBloc,
                  builder: (context, state) {
                    if (state is MovieSearchStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is MovieSearchStateFailure) {
                      return const MovieSearchWidget();
                    }
                    if (state is MovieSearchStateSuccess) {
                      return MovieSearchWidget(
                        data: state.data,
                      );
                    }

                    return const MovieSearchWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
