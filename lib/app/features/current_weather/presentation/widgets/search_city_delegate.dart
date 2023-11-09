import 'package:app_test_cloudwalk/app/features/current_weather/domain/entities/current_weather_entity.dart';
import 'package:flutter/material.dart';

import 'city_card_current_weather_widget.dart';

class SearchCityDelegate extends SearchDelegate {
  SearchCityDelegate({
    required this.currentWeatherList,
    required this.onTap,
  });
  final List<CurrentWeatherEntity> currentWeatherList;
  VoidCallback onTap;
  List<CurrentWeatherEntity> _suggestionList = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => ListView.builder(
        itemCount: _suggestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return CityCardCurrentWeatherWidget(
            onTap: onTap,
            currentWeather: _suggestionList[index],
          );
        },
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    _suggestionList = [];
    query.isEmpty
        ? _suggestionList = currentWeatherList
        : _suggestionList.addAll(
            currentWeatherList.where(
              (element) => element.name!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            ),
          );
    return ListView.builder(
      itemCount: _suggestionList.length,
      itemBuilder: (context, index) {
        return CityCardCurrentWeatherWidget(
          onTap: onTap,
          currentWeather: _suggestionList[index],
        );
      },
    );
  }
}
