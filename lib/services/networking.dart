import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final dynamic url;

  Future<void> getData() async {
    //
    // var weatherUrl = Uri(
    //     scheme: 'http',
    //     host:'api.openweathermap.org',
    //     path:'/data/2.5/weather',
    //     queryParameters: {'lat' : latitude.toString(), 'lon' : longitude.toString(), 'appid' : apiKey}
    // );

    http.Response response = await http.get(url);
    // print(response.body);
    // print(response.statusCode);
    // print(weatherUrl);

    if (response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
      // var longitude = jsonDecode(data)['coord']['lon'];
      // var latitude = jsonDecode(data)['coord']['lat'];
      // print('longitude= ${longitude} and latitude= ${latitude}');
      // var weatherDes = jsonDecode(data)['weather'][0]['description'];
      // print('description= ${weatherDes}');
      //
      // var decodedData = jsonDecode(data);
      // String cityName =decodedData['name'];
      // int condition = decodedData['weather'][0]['id'];
      // double temperature = decodedData['main']['temp'];

    }else {
      print('getData() = ${response.statusCode}');

    }
  }

}