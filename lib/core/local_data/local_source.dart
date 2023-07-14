import 'package:hive/hive.dart';

class LocalSource {
  final Box<dynamic> box;
  LocalSource(this.box);

  void setLocation(String locationName) {
    box.put('location', locationName);
  }

  String getCurrentLocation() {
    return box.get('location') ?? false;
  }
  String getLocation(){
    return box.get('location');
  }
}