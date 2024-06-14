import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../secret/secret_key.dart';

class ImageRepository {
  static Future<Response> getData() async {
    return await http.get(Uri.parse(
        '${Protected.apiBaseUrl}?key=${Protected.apiKey}&per_page=30'));
  }

  static Future<Response> searchData(String searchData) async {
    final encodedQuery = Uri.encodeComponent(searchData);
    final url =
        '${Protected.apiBaseUrl}?key=${Protected.apiKey}&q=$encodedQuery&per_page=50&safesearch=true';
    return await http.get(Uri.parse(url));
  }
}
