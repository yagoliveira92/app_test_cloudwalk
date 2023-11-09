import 'package:app_test_cloudwalk/app/common/remote_datasource/models/remote_data.dart';

abstract class ICurrentWeatherRemoteDataSource {
  Future<RemoteData> getCurrentWeather({required String city});
}
