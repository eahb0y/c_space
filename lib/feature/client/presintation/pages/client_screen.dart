import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ClientScreen extends StatelessWidget {
  final String name;

  const ClientScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              minimumSize: Size(150, 45), backgroundColor: Colors.purple),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}
