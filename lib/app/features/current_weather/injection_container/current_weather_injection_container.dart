import 'package:app_test_cloudwalk/app/common/local_datasource/manager/i_local_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/local_datasource/current_weather_local_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/remote_datasource/current_weather_remote_datasource.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/repositories/current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/repositories/i_current_weather_repository.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';
import 'package:get_it/get_it.dart';

class CurrentWeatherInjectionContainer {
  void call(GetIt dependency) {
    dependency.registerFactory(
      () => CurrentWeatherRemoteDataSource(
          remoteDataManager: dependency<IRemoteDataManager>()),
    );

    dependency.registerFactory(
      () => CurrentWeatherLocalDataSource(
        localDataManager: dependency<ILocalDataManager>(),
      ),
    );

    dependency.registerFactory<ICurrentWeatherRepository>(
      () => CurrentWeatherRepository(
        localDataSource: dependency<CurrentWeatherLocalDataSource>(),
        remoteDataSource: dependency<CurrentWeatherRemoteDataSource>(),
      ),
    );

    dependency.registerFactory(
      () => GetCurrentWeatherUseCase(
        repository: dependency<ICurrentWeatherRepository>(),
      ),
    );

    dependency.registerFactory(
      () => CurrentWeatherCubit(
        getCurrentWeatherUsecase: dependency<GetCurrentWeatherUseCase>(),
      ),
    );
  }
}
