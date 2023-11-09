enum CitiesConcertWeatherEnum {
  silverstone(name: 'Silverstone', country: 'UK'),
  saoPaulo(name: 'São Paulo', country: 'BR'),
  melbourne(name: 'Melbourne', country: 'AU'),
  monteCarlo(name: 'Monte Carlo', country: 'MC');

  const CitiesConcertWeatherEnum({
    required this.name,
    required this.country,
  });

  final String name;
  final String country;

  String get getCity => '$name,$country';
}
