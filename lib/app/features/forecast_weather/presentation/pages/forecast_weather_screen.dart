import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/manager/cubit/forecast_weather_cubit.dart';
import 'package:app_test_cloudwalk/app/features/forecast_weather/presentation/widgets/card_forecast_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastWeatherScreen extends StatefulWidget {
  const ForecastWeatherScreen({super.key});

  @override
  _ForecastWeatherScreenState createState() => _ForecastWeatherScreenState();
}

class _ForecastWeatherScreenState extends State<ForecastWeatherScreen> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ForecastWeatherCubit, ForecastWeatherState>(
        builder: (context, state) {
          return switch (state) {
            ForecastWeatherLoading() => const Scaffold(
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
            ForecastWeatherSuccess() => Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                  title: Text(
                      'Forecast Weather - ${state.forecastWeatherEntity.city?.name}'),
                ),
                body: CustomScrollView(
                  physics: const ScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15.0,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final forecastWeather =
                              state.forecastWeatherEntity.list![index];
                          return CardForecastWeatherWidget(
                            forecastWeather: forecastWeather,
                          );
                        },
                        childCount: state.forecastWeatherEntity.list!.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 12.0,
                      ),
                    )
                  ],
                ),
              ),
            ForecastWeatherError() => const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
      );
}
