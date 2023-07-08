import 'package:c_space/router/rout/rout.dart';
import 'package:c_space/router/rout_name/rout_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'feature/client/presintation/client_bloc/client_bloc.dart';
import 'feature/main_page/bloc/main_page_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('location_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context) => ClientBloc()),
      BlocProvider(create: (context) => WelcomeScreenBloc())
    ]
        , child: MaterialApp(
          onGenerateRoute: Rout.controller,
          initialRoute: RoutName.mainPage,
        ));

  }
}
