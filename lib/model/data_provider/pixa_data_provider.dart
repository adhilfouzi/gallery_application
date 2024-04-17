import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  static Future<List> getImages() async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=37775942-8c9d29341ec492be8cdeb5544'));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      return List.from(decodedResponse['hits']);
    } else {
      throw Exception('Failed to load images');
    }
  }
}
