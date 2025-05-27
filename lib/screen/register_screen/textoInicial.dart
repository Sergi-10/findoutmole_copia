import 'package:flutter/material.dart';

class TextoInicial extends StatelessWidget {
  const TextoInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Registro de Usuario',
      style: TextStyle(
        color: Colors.white,
        fontSize: 44,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
