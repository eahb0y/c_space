import 'package:c_space/feature/main_page/bloc/main_page_bloc.dart';
import 'package:c_space/router/rout_name/rout_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.value,
  });

  final String? value;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeScreenBloc, WelcomeScreenState>(
      builder: (context, state) {
        String name = state.locationName;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: isSelected ? Colors.purple : Colors.red , width: 1),
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: () {
                  context.read<WelcomeScreenBloc>().add(SetLocation(
                   currentLocation: widget.value ?? ' '));
                  Navigator.pushNamed(context, RoutName.qrPage);
                  print(name);
                },
              child: const Text(
                'Войти',
                style: TextStyle(
                  color:  Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )),
        );
      },
    );
  }
}
