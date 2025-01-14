class WeatherModel {
  String? cityName;
  String? country;
  String? condition;
  double? temperature;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? windSpeed;

  WeatherModel({
    this.cityName,
    this.country,
    this.condition,
    this.temperature,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    try {
      final List? weatherList = json['weather'] as List?;
      
      return WeatherModel(
        cityName: json['name'] as String?,
        country: json['sys']?['country'] as String?,
        condition: weatherList?.isNotEmpty == true ? weatherList![0]['description'] as String? : null,
        temperature: _convertToDouble(json['main']?['temp']),
        feelsLike: _convertToDouble(json['main']?['feels_like']),
        pressure: _convertToInt(json['main']?['pressure']),
        humidity: _convertToInt(json['main']?['humidity']),
        windSpeed: _convertToDouble(json['wind']?['speed']),
      );
    } catch (e) {
      throw FormatException('Failed to parse weather data: $e');
    }
  }

  static double? _convertToDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value);
    return null;
  }

  static int? _convertToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.round();
    if (value is String) return int.tryParse(value);
    return null;
  }

  @override
  String toString() {
    return 'WeatherModel(cityName: $cityName, country: $country, condition: $condition, temperature: $temperature, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, windSpeed: $windSpeed)';
  }
}
