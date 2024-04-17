import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/data_provider/pixa_data_provider.dart';

class PixaRepository extends GetxController {
  //   Future<bool> delectById(String id) async {
  //    final response = await TodoDataProvider.deleteTodoData(id);
  //   return response == 200;
  // }

  Future<List?> fetchImages() async {
    return await DataProvider.getImages();
  }

  // Future<bool> updatedata(String id, Map body) async {
  //    final statusCode = await TodoDataProvider.putTodoData(id, body);
  //    return (statusCode == 200 || statusCode == 201);
  // }

  // Future<bool> addData(Map body) async {
  //   final statusCode = await TodoDataProvider.postTodoData(body);
  //    return statusCode == 201;
  // }
}
