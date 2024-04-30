import 'package:get_it/get_it.dart';
import 'package:texoit/core/interfaces/network_service_interface.dart';
import 'package:texoit/core/network/network_service.dart';
import 'package:http/http.dart' as http;
import 'package:texoit/modules/dashboard/dashboard_module.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class DependencyInjection {
  
  static Future<void> setup() async {
    //Registro do network
    INetworkService networkService = getIt.registerSingleton<INetworkService>(
      HttpNetworkService(httpClient: http.Client()),
    );

    //Inicializacao do dashboard module
    DashboardModule.setup(networkService: networkService);
  }
}
