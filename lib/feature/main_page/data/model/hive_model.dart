import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject {
  final String location;
  HiveModel({required this.location});
}