import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../model/db_model/album_model.dart';

class AlbumController extends GetxController {
  var albumimages = <AlbumModel>[].obs;
  late Box<AlbumModel> albumBox;

  @override
  void onInit() {
    super.onInit();
    albumBox = Hive.box<AlbumModel>('albums');
    updateAlbumImages();
  }

  void updateAlbumImages() {
    albumimages.value = albumBox.values.toList();
  }

  Future<void> addData(AlbumModel value) async {
    final id = await albumBox.add(value);
    value.id = id;
    await albumBox.put(id, value);
    updateAlbumImages();
  }

  void deleteData(int key) {
    albumBox.delete(key);
    updateAlbumImages();
  }
}
