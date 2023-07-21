import 'dart:io';
import 'package:c_space/feature/client/presintation/bloc/client_get_time_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_qr.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_get_time_bloc/employee_get_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_set_time_bloc/employee_set_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/page/widget/employee_qr.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'core/local_data/local_source.dart';
import 'feature/login/bloc/login_page_bloc.dart';
import 'feature/main/presentation/bloc/main_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  await initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  sl.registerFactory(() => ClientGetTimeBloc());
  sl.registerFactory(() => ClientSetTimeBloc());
  sl.registerFactory(() => EmployeeSetTimeBloc());
  sl.registerFactory(() => EmployeeGetTimeBloc());
  sl.registerFactory(() => LoginPageBloc());
  sl.registerFactory(() => TimeBloc());
  sl.registerLazySingleton<MainBloc>(() => MainBloc());
  sl.registerFactory(() => ClientQr());
  sl.registerFactory(() => EmployeeQr());
}

Future<void> initHive() async {
  const boxName = 'location_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
