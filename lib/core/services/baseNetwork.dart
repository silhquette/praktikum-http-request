import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";

  static Future<List<dynamic>> get(String partUrl) async {
    // menggabungkan URL dengan partial url
    final fullUrl = baseUrl + partUrl;

    // kirim request GET ke server
    final response = await http.get(Uri.parse(fullUrl));

    if(response.body.isNotEmpty) {
      Future.delayed(Duration(seconds: 20));
      print(response.body);
      return json.decode(response.body);
    } else {
      return [
        {
          "error": true,
          "message": "gatau sumpah ini kenapa"
        }
      ];
    }
  }
}