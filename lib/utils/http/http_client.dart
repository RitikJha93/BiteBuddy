import "dart:convert";

import "package:http/http.dart" as http;

class THttpHelper {
  static const String baseurl = "";

  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseurl/$endpoint'));
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data" + "${response.statusCode}");
    }
  }
}
