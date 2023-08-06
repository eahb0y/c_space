import 'package:c_space/feature/client/presintation/bloc/client_get_time_bloc/client_bloc.dart';
import 'package:c_space/feature/client/presintation/pages/widgets/client_screen_widget.dart';
import 'package:c_space/router/rout.dart';
import 'package:c_space/router/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'argument/client_argument_info.dart';

class ClientScreen extends StatefulWidget {
  final String name;

  const ClientScreen({
    super.key,
    required this.name,
  });

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ClientGetTimeBloc>().add(
      ClientGetTime(
        name: widget.name,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ClientGetTimeBloc, ClientGetTimeState>(
      builder: (context, state) {
        return Scaffold(
          body:  Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: Lottie.asset(
                'assets/animation/check_animation.json',
                repeat: false,
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 45),
                backgroundColor: Colors.purple
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Назад'),
            ),
          ),
        );
      },
    );
  }
}
