import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl = '127.0.0.1:3002';
  Future<String> get(
      {required String endpoint, required String errorText}) async {
    try {
      var url = Uri.http(baseUrl, endpoint);
      var response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception(response.statusCode);
      }
      return response.body;
    } catch (e) {
      throw Exception('$errorText: $e');
    }
  }
}
