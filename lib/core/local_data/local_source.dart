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

class LocalClientSource{
  final Box<dynamic> box;
  LocalClientSource(this.box);

  void setClient(String client){
    box.put('client_${client}', client);
  }
  String getClient() {
    return box.get('client');
  }
  void deleteClient(String client){
    box.delete('client_${client}');
  }
}

class LocalEmployeeSource{
  final Box<dynamic> box;
  LocalEmployeeSource(this.box);
  void setEmployee(String employee){
    box.put('employee_${employee}', employee);
  }
  String getEmployee() {
    return box.get('employee');
  }
}