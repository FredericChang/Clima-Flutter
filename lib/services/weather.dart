import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = 'bf1fd9b91d8d9ec921a23c223266d14b';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var weatherUrl = Uri(
        scheme: 'http',
        host:'api.openweathermap.org',
        path:'/data/2.5/weather',
        queryParameters: {
          'q' : cityName,
          'appid' : apiKey,
          'units' : 'metric',
        }
    );
    NetworkHelper newworkHelper = NetworkHelper(weatherUrl);
    var weatherData = await newworkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    var weatherUrl = Uri(
        scheme: 'http',
        host:'api.openweathermap.org',
        path:'/data/2.5/weather',
        queryParameters: {
          'lat' : location.latitude.toString(),
          'lon' : location.longitude.toString(),
          'appid' : apiKey,
          'units' : 'metric'
        }
    );
    NetworkHelper newworkHelper = NetworkHelper(weatherUrl);
    var weatherData = await newworkHelper.getData();
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
