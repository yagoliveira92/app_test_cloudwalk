import 'package:app_test_cloudwalk/app/features/forecast_weather/domain/entities/forecast_item_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardForecastWeatherWidget extends StatelessWidget {
  const CardForecastWeatherWidget({required this.forecastWeather, super.key});

  final ForecastItemEntity forecastWeather;

  @override
  Widget build(BuildContext context) {
    final pattern = DateFormat('dd-MM-yyyy hh:mm');
    return Card(
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: CachedNetworkImage(
            imageUrl:
                'https://openweathermap.org/img/w/${forecastWeather.weather?.first.icon ?? ''}.png',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        title: Text(
          pattern.format(
            DateTime.fromMillisecondsSinceEpoch(
              (forecastWeather.dt ?? 0) * 1000,
              isUtc: true,
            ),
          ),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Temperature: ${forecastWeather.main?.temp ?? ''}° - Humidity: ${forecastWeather.main?.humidity ?? ''}% - Pressure: ${forecastWeather.main?.pressure ?? ''} - Max/Min: ${forecastWeather.main?.tempMax ?? ''}°/${forecastWeather.main?.tempMin ?? ''}°',
        ),
      ),
    );
  }
}
