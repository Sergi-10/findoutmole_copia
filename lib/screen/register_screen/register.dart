import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hola, soy la pagina de registro'),
          SizedBox(width: 20),
          Icon(Icons.account_circle),
        ],
      ),
    );
  }
}
