import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'feature/client/presintation/bloc/client_bloc/client_bloc.dart';
import 'feature/client/presintation/bloc/time_bloc/time_bloc.dart';
import 'feature/main_page/bloc/main_page_bloc.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ClientBloc()),
          BlocProvider(create: (context) => WelcomeScreenBloc()),
          BlocProvider(create: (context) => TimeBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Rout.controller,
          initialRoute: RoutName.initial,
        ));
  }
}
