import 'package:hive/hive.dart';

class LocalSource {
  final Box<dynamic> box;
  LocalSource(this.box);

  void setHasProfile(String locationName) {
    box.put('location', locationName);
  }

  bool getHasProfile() {
    return box.get('location') ?? false;
  }
}