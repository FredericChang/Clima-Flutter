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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }
  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
