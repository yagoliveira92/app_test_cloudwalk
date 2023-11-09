import 'package:app_test_cloudwalk/app/common/local_datasource/manager/i_local_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/local_datasource/forecast_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/remote_datasource/forecast_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/repositories/forecast_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/repositories/i_forecast_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';
import 'package:get_it/get_it.dart';

class ForecastWeatherInjectionContainer {
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => ForecastWeatherRemoteDataSource(
          remoteDataManager: dependency<IRemoteDataManager>()),
    );

    dependency.registerFactory(
      () => ForecastWeatherLocalDataSource(
        localDataManager: dependency<ILocalDataManager>(),
      ),
    );

    dependency.registerFactory<IForecastWeatherRepository>(
      () => ForecastWeatherRepository(
        localDataSource: dependency<ForecastWeatherLocalDataSource>(),
        remoteDataSource: dependency<ForecastWeatherRemoteDataSource>(),
      ),
    );

    dependency.registerFactory(
      () => GetForecastWeatherUseCase(
        repository: dependency<IForecastWeatherRepository>(),
      ),
    );

    dependency.registerFactory(
      () => ForecastWeatherCubit(
        getForecastWeatherUseCase: dependency<GetForecastWeatherUseCase>(),
      ),
    );
  }
}
