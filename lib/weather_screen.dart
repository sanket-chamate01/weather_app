import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/hourly_forecast_card.dart';

class WeatherScreen extends StatelessWidget {
  final IconData weatherIcon;
  final String temperature, weather;
  const WeatherScreen(
      {super.key,
      required this.weatherIcon,
      required this.temperature,
      required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('refresh');
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temperature' "K",
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Icon(
                            weatherIcon,
                            size: 64,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            weather,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // weather forecast cards
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastCard(
                    weatherIcon: Icons.cloud_rounded,
                    time: "03:00",
                    temperature: "300.17",
                  ),
                  HourlyForecastCard(
                    weatherIcon: Icons.cloud_rounded,
                    time: "06:00",
                    temperature: "300.17",
                  ),
                  HourlyForecastCard(
                    weatherIcon: Icons.sunny,
                    time: "09:00",
                    temperature: "300.17",
                  ),
                  HourlyForecastCard(
                    weatherIcon: Icons.sunny,
                    time: "12:00",
                    temperature: "300.17",
                  ),
                  HourlyForecastCard(
                    weatherIcon: Icons.sunny,
                    time: "15:00",
                    temperature: "300.17",
                  ),
                  // SizedBox(
                  //   width: 100,
                  //   child: HourlyForecastCard(), HourlyForecastCard(),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // additional information
            const Text(
              'Additional Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfor(
                    weatherIcon: Icons.water_drop_rounded,
                    iconName: "Humidity",
                    iconValue: "91"),
                AdditionalInfor(
                    weatherIcon: Icons.air,
                    iconName: "Wind Speed",
                    iconValue: "7.67"),
                AdditionalInfor(
                    weatherIcon: Icons.line_weight_rounded,
                    iconName: "Pressure",
                    iconValue: "1006"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
