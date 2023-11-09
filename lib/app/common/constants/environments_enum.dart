enum Environments {
  production(
    type: 'production',
    apiBaseUrl: 'https://api.openweathermap.org/data/2.5/',
  ),
  development(
    type: 'development',
    apiBaseUrl: 'https://api.openweathermap.org/data/2.5/',
  );

  const Environments({
    required this.type,
    required this.apiBaseUrl,
  });

  final String type;
  final String apiBaseUrl;
}
