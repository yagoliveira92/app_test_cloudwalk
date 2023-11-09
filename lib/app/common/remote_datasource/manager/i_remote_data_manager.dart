import '../models/remote_data.dart';
import '../models/endpoint.dart';

abstract class IRemoteDataManager {
  Future<RemoteData> request({required Endpoint endpoint});
}
