import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/endpoint.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/methods_enum.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/data/data_sources/remote_datasource/i_forecast_weather_remote_datasource.dart';

class ForecastWeatherRemoteDataSource
    implements IForecastWeatherRemoteDataSource {
  const ForecastWeatherRemoteDataSource({
    required this.remoteDataManager,
  });

  final IRemoteDataManager remoteDataManager;

  @override
  Future<RemoteData> getForecastWeather({required String city}) async {
    final endpoint = Endpoint(
      method: Methods.get,
      query: {
        'units': 'metric',
      },
      path: '/forecast?q=$city',
    );
    return remoteDataManager.request(endpoint: endpoint);
  }
}
