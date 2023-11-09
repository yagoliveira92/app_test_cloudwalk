import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CityCardCurrentWeatherWidget extends StatelessWidget {
  const CityCardCurrentWeatherWidget({
    required this.currentWeather,
    required this.onTap,
    super.key,
  });

  final CurrentWeatherEntity currentWeather;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              imageUrl:
                  'https://openweathermap.org/img/w/${currentWeather.weatherEntities?.first.icon ?? ''}.png',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          title: Text(
              'City: ${currentWeather.name ?? ''} - ${currentWeather.weatherEntities?.first.description ?? ''}'),
          subtitle: Text(
            'Temperature: ${currentWeather.main?.temp ?? ''}° - Humidity: ${currentWeather.main?.humidity ?? ''} - Pressure: ${currentWeather.main?.pressure ?? ''} - Max/Min: ${currentWeather.main?.tempMax ?? ''}°/${currentWeather.main?.tempMin ?? ''}°',
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: onTap,
        ),
      );
}
