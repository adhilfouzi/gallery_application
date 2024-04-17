import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PixaController extends GetxController {
  static const String _apiKey = '37775942-8c9d29341ec492be8cdeb5544';
  static const String _apiBaseUrl = 'https://pixabay.com/api/';

  var images = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse('$_apiBaseUrl?key=$_apiKey'));
      handleResponse(response);
    } catch (e) {
      handleError(e.toString());
    }
  }

  void handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      if (decodedResponse['hits'] != null) {
        images.assignAll(
            List<Map<String, dynamic>>.from(decodedResponse['hits']));
      } else {
        handleError('No image data found');
      }
    } else {
      handleError('Failed to load images: ${response.statusCode}');
    }
    isLoading(false);
  }

  void handleError(String errorMessage) {
    log('Error: $errorMessage');
    isLoading(false);
  }
}
