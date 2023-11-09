import 'package:app_test_cloudwalk/app/common/constants/app_constants_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/provider/i_remote_data_provider.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/provider/remote_data_provider.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/injection_container/current_weather_injection_container.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/injection_container/forecast_weather_injection_container.dart';
import 'package:get_it/get_it.dart';

import 'constants/environments_enum.dart';
import 'local_datasource/manager/i_local_data_manager.dart';
import 'local_datasource/manager/local_data_manager.dart';

final dependency = GetIt.instance;

const environment = Environments.production;
Future<void> init() async {
  dependency.registerLazySingleton<ILocalDataManager>(
    () => LocalDataManager(),
  );

  dependency.registerLazySingleton<IAppConstantsManager>(
    () => AppConstantsManager(
      apiBaseUrl: environment.apiBaseUrl,
    ),
  );

  dependency.registerLazySingleton<IRemoteDataProvider>(
    () => RemoteDataProvider(
      appConstants: dependency<IAppConstantsManager>(),
    ),
  );

  dependency.registerLazySingleton<IRemoteDataManager>(
    () => RemoteDataManager(
      dataProvider: dependency<IRemoteDataProvider>(),
    ),
  );

  final customWeatherInjectionContainer = CurrentWeatherInjectionContainer();
  customWeatherInjectionContainer(dependency);

  final forecastWeatherInjectionContainer = ForecastWeatherInjectionContainer();
  forecastWeatherInjectionContainer(dependency);
}
