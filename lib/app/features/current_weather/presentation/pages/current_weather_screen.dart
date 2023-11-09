import 'package:app_test_cloudwalk/app/common/injection_container.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/presentation/manager/cubit/current_weather_cubit.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/presentation/widgets/city_card_current_weather_widget.dart';
import 'package:app_test_cloudwalk/app/features/current_weather/presentation/widgets/search_city_delegate.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/pages/forecast_weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
        builder: (context, state) {
          return switch (state) {
            CurrentWeatherInitial() => const Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            CurrentWeatherLoading() => const Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            CurrentWeatherSuccess() => Scaffold(
                appBar: AppBar(
                  title: const Text('Current Weather'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchCityDelegate(
                            currentWeatherList: state.currentWeatherList,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: ListView.builder(
                  itemCount: state.currentWeatherList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CityCardCurrentWeatherWidget(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<ForecastWeatherCubit>(
                              create: (context) =>
                                  dependency<ForecastWeatherCubit>()
                                    ..getForecast(
                                        city: state.currentWeatherList[index]
                                                .name ??
                                            ''),
                              child: const ForecastWeatherScreen(),
                            ),
                          ),
                        );
                      },
                      currentWeather: state.currentWeatherList[index],
                    );
                  },
                ),
              ),
            CurrentWeatherError() => const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      );
}
