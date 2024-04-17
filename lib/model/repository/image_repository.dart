import 'package:gallery_application/model/secret/secret_key.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ImageRepository {
  static Future<Response> getData() async {
    return await http
        .get(Uri.parse('${Protected.apiBaseUrl}?key=${Protected.apiKey}'));
  }
}
