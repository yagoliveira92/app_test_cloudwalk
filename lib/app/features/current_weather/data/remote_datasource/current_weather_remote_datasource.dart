import 'package:app_test_cloudwalk/app/common/remote_datasource/manager/i_remote_data_manager.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/endpoint.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/methods_enum.dart';
import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/data/remote_datasource/i_current_weather_remote_datasource.dart';

class CurrentWeatherRemoteDataSource
    implements ICurrentWeatherRemoteDataSource {
  const CurrentWeatherRemoteDataSource({
    required this.remoteDataManager,
  });

  final IRemoteDataManager remoteDataManager;

  @override
  Future<RemoteData> getCurrentWeather({required String city}) async {
    final endpoint = Endpoint(
      method: Methods.get,
      query: {
        'units': 'metric',
      },
      path: '/weather?q=$city',
    );
    return remoteDataManager.request(endpoint: endpoint);
  }
}
