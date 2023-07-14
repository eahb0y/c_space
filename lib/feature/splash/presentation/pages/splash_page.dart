import 'package:c_space/core/local_data/local_source.dart';
import 'package:c_space/core/qr_scan/qrscan_argument.dart';
import 'package:c_space/injection_container.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        FlutterNativeSplash.remove();
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (context.mounted) {
          if (sl<LocalSource>().box.isNotEmpty) {
            Navigator.of(context).pushReplacementNamed(
              RoutName.qrPage,
              arguments: QrScanArgument(
                locationName: sl<LocalSource>().getLocation(),
              ),
            );
          } else {
            Navigator.of(context).pushReplacementNamed(RoutName.mainPage);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Image(
          height: 100,
          image: AssetImage('assets/images/c_space.png'),
          //fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
