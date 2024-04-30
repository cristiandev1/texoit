import 'package:get_it/get_it.dart';
import 'package:texoit/core/interfaces/network_service_interface.dart';

import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource.dart';
import 'package:texoit/modules/dashboard/features/dashboard/data/datasource/dashboard_network_datasource_impl.dart';

import 'package:texoit/modules/dashboard/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/get_all_movies_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/interval_producers_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/movies_by_year_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/studio_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/domain/usecases/year_with_multiple_winners_usecase.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/interval_producers/interval_producers_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/movie_search/movie_search_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/studios_with_winners/studios_with_winners_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/dashboard/bloc/win_count/win_count_bloc.dart';
import 'package:texoit/modules/dashboard/features/dashboard/presentation/pages/movie_list/bloc/movie_bloc.dart';

class DashboardModule {
  static final GetIt getIt = GetIt.instance;

  static void setup({
    required INetworkService networkService,
  }) {
    /// Dashboard datasource network
    IDashboardNetworkDatasource dashboardNetworkDatasource =
        getIt.registerSingleton<IDashboardNetworkDatasource>(
      DashboardNetworkDatasourceImpl(
        networkService,
      ),
    );

    /// Dashboard repository
    IDashboardRepository repository =
        getIt.registerSingleton<IDashboardRepository>(
      DashboardRepositoryImpl(networkDatasource: dashboardNetworkDatasource),
    );

    ///Usecases

    GetAllMoviesUsecase getAllMoviesUsecase =
        getIt.registerSingleton<GetAllMoviesUsecase>(
      GetAllMoviesUsecase(repository: repository),
    );

    YearWithMultipleWinnersUsecase getYearsWithMultipleWinners =
        getIt.registerSingleton<YearWithMultipleWinnersUsecase>(
      YearWithMultipleWinnersUsecase(repository: repository),
    );

    StudioWinnersUsecase studioWinnersUsecase =
        getIt.registerSingleton<StudioWinnersUsecase>(
      StudioWinnersUsecase(repository: repository),
    );

    IntervalProducersUsecase intervalProducersUsecase =
        getIt.registerSingleton<IntervalProducersUsecase>(
      IntervalProducersUsecase(repository: repository),
    );

    MoviesByYearUsecase moviesByYearUsecase =
        getIt.registerSingleton<MoviesByYearUsecase>(
      MoviesByYearUsecase(repository: repository),
    );

    /// Bloc's
    getIt.registerSingleton<WinCountBloc>(
      WinCountBloc(yearWithMultipleWinnersUsecase: getYearsWithMultipleWinners),
    );

    getIt.registerSingleton<StudiosWithWinnersBloc>(
      StudiosWithWinnersBloc(studioWinnersUsecase: studioWinnersUsecase),
    );

    getIt.registerSingleton<IntervalProducersBloc>(
      IntervalProducersBloc(intervalProducersUsecase: intervalProducersUsecase),
    );

    getIt.registerSingleton<MovieSearchBloc>(
      MovieSearchBloc(moviesByYearUsecase: moviesByYearUsecase),
    );

    getIt.registerSingleton<MovieBloc>(
      MovieBloc(getAllMoviesUsecase: getAllMoviesUsecase),
    );
    
  }
}
