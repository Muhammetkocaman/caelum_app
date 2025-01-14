import 'package:flutter/material.dart';
import '../model/weather_model.dart';
import '../utils/constanst.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherModel weather;

  const CurrentWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${weather.cityName ?? 'Unknown'}, ${weather.country ?? 'Unknown'}",
                        style: kTitleFont.copyWith(fontSize: 24),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Text(
                    weather.condition ?? 'Unknown',
                    style: kTitleFont.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Text(
                "${weather.temperature?.round() ?? 0}°",
                style: kTitleFont.copyWith(fontSize: 48),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
