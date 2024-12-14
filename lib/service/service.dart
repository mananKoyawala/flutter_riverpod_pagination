import 'package:http/http.dart' as http;

class HTTPClient {
  final _httpClient = http.Client();

  Future<http.Response?> get(String path) async {
    try {
      var res = await _httpClient.get(Uri.parse(path));
      return res;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
