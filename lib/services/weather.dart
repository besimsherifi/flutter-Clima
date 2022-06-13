import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  String apiKey = '44c089b00d79fdad4dc74d12b8a3d9e7';
  String openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Networking network = Networking(
        '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric');

    var weatherData = await network.getData();

    return weatherData;
  }

  Future getCityWeather(String city) async {
    var url = '$openWeatherUrl?q=$city&appid=${apiKey}&units=metric';
    Networking neworking = Networking(url);
    var weatherData = await neworking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
