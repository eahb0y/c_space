import 'dart:io';
import 'package:c_space/feature/client/presintation/bloc/client_bloc/client_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'core/local_data/local_source.dart';
import 'feature/main_page/bloc/main_page_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  await initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  sl.registerSingleton<WelcomeScreenBloc>(WelcomeScreenBloc());
  sl.registerSingleton<ClientBloc>(ClientBloc());
}

Future<void> initHive() async {
  const boxName = 'location_box';
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
