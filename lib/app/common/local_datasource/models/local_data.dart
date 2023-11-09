class LocalData {
  LocalData({
    this.id,
    this.data,
  });

  final String? id;
  final dynamic data;

  bool get hasData => data != null;
}
