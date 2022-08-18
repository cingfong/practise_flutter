import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(
    this.urlStr,
    this.route,
    this.latitude,
    this.longitude,
    this.apiKey,
  );
  final String urlStr;
  final String route;
  final String latitude;
  final String longitude;
  final String apiKey;
  Future getData() async {
    var url = Uri.https(
      urlStr,
      route,
      {'lat': latitude, 'lon': longitude, 'appid': apiKey},
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
