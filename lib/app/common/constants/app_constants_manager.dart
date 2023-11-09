abstract class IAppConstantsManager {
  String get apiBaseUrl;
}

class AppConstantsManager implements IAppConstantsManager {
  const AppConstantsManager({
    required String apiBaseUrl,
  }) : _apiBaseUrl = apiBaseUrl;

  final String _apiBaseUrl;

  @override
  String get apiBaseUrl => _apiBaseUrl;
}
