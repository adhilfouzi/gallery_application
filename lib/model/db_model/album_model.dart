import 'package:hive/hive.dart';

part 'album_model.g.dart';

@HiveType(typeId: 0)
class AlbumModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String imagex;

  AlbumModel({this.id, required this.imagex});
}
