import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model1 extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  HiveList<Model2>? list;

  Model1({this.id, this.list});
}

@HiveType(typeId: 1)
class Model2 extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  Model2({this.id, this.name});
}
