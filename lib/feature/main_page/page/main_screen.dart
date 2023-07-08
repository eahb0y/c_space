import 'package:c_space/core/qr_scan/qrscan.dart';
import 'package:c_space/feature/main_page/bloc/main_page_bloc.dart';
import 'package:c_space/feature/main_page/page/widgets/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override

  //** initialize to check has any data in local storage **//
  void initState() {
    super.initState();
    WelcomeScreenBloc initValue = BlocProvider.of<WelcomeScreenBloc>(context);
    initValue.add(InitialEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeScreenBloc, WelcomeScreenState>(builder: (context, state){
      return state.hasLocation ? QRSan(locationName: state.locationName) : MainScreenWidget();
    });
  }
}


