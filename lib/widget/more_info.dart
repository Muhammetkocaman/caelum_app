import 'package:flutter/material.dart';
import '../model/weather_model.dart';

class MoreInfo extends StatelessWidget {
  final WeatherModel weather;

  const MoreInfo({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoBox(
            title: "Wind",
            value: "${weather.windSpeed?.toStringAsFixed(1) ?? '0'} m/s",
            icon: Icons.air,
          ),
          _buildInfoBox(
            title: "Humidity",
            value: "${weather.humidity ?? '0'}%",
            icon: Icons.water_drop,
          ),
          _buildInfoBox(
            title: "Feels Like",
            value: "${weather.feelsLike?.round() ?? '0'}°",
            icon: Icons.thermostat,
          ),
          _buildInfoBox(
            title: "Pressure",
            value: "${weather.pressure ?? '0'} hPa",
            icon: Icons.speed,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
