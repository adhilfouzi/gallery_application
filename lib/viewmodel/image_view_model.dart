import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_application/model/repository/image_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ImageViewModel extends GetxController {
  var allImages = <Map<String, dynamic>>[].obs;
  var filteredImages = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData({String? searchData}) async {
    try {
      isLoading(true);
      final response = searchData != null
          ? await ImageRepository.searchData(searchData)
          : await ImageRepository.getData();
      handleResponse(response);
    } catch (e) {
      handleError("Please Check the Connectivity");
    }
  }

  void handleResponse(http.Response response) {
    log("statusCode :${response.statusCode}");
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse['hits'] != null) {
        allImages.assignAll(
            List<Map<String, dynamic>>.from(decodedResponse['hits']));
        filteredImages.assignAll(allImages);
        errorMessage('');
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
    this.errorMessage(errorMessage);
  }

  void filterImages(String query) {
    if (query.isEmpty) {
      filteredImages.assignAll(allImages);
      return;
    }

    final filtered = allImages.where((image) =>
        image['user'].toString().toLowerCase().contains(query.toLowerCase()));
    filteredImages.assignAll(filtered.toList());

    if (filteredImages.isEmpty) {
      errorMessage('No images found for "$query"');
    } else {
      errorMessage('');
    }
  }
}
