import 'dart:io';
import 'package:c_space/feature/client/presintation/bloc/client_set_time_bloc/client_set_time_bloc.dart';
import 'package:c_space/feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_qr.dart';
import 'package:c_space/feature/employee/presentation/bloc/employee_set_time_bloc/employee_set_time_bloc.dart';
import 'package:c_space/feature/employee/presentation/page/widget/employee_qr.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'core/local_data/local_source.dart';
import 'feature/debt/presentation/bloc/check_box_bloc/debt_bloc.dart';
import 'feature/debt/presentation/bloc/debt_add_bloc/debt_add_bloc.dart';
import 'feature/debt/presentation/bloc/debt_get_bloc/debt_get_bloc.dart';
import 'feature/history/presentation/bloc/client_bloc/client_bloc.dart';
import 'feature/problems/presentation/bloc/issue_get/issue_get_bloc.dart';
import 'feature/login/bloc/login_page_bloc.dart';
import 'feature/main/presentation/bloc/main_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;
late Box<dynamic> _clientBox;
late Box<dynamic> _employeeBox;

Future<void> init() async {
  await initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  sl.registerSingleton<LocalClientSource>(LocalClientSource(_clientBox));
  sl.registerSingleton<LocalEmployeeSource>(LocalEmployeeSource(_employeeBox));
  sl.registerFactory(() => ClientSetTimeBloc());
  sl.registerFactory(() => EmployeeSetTimeBloc());
  sl.registerFactory(() => LoginPageBloc());
  sl.registerFactory(() => TimeBloc());
  sl.registerLazySingleton<MainBloc>(() => MainBloc());
  sl.registerFactory(() => ClientQr());
  sl.registerFactory(() => EmployeeQr());
  sl.registerFactory(() => IssueGetBloc());
  sl.registerFactory(() => ClientBloc());
  sl.registerFactory(() => DebtBloc());
  // sl.registerFactory(() => DebtAddBloc());
  sl.registerFactory(() => DebtGetBloc());

}

Future<void> initHive() async {
  const boxName = 'location_box';
  const clientBox = 'client_box';
  const employeeBox = 'employee_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
  _clientBox = await Hive.openBox<dynamic>(clientBox);
  _employeeBox = await Hive.openBox<dynamic>(employeeBox);
}
