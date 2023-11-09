class RemoteData {
  RemoteData({
    this.data,
    this.statusCode,
    this.noConnection = false,
  });

  final dynamic data;
  final int? statusCode;
  final bool noConnection;

  bool get isSuccess {
    if (statusCode != null) {
      return statusCode! >= 200 && statusCode! < 300;
    }
    return false;
  }
}
