// lib/screen/login_screen/text_mole.dart
import 'package:flutter/material.dart';

class MoleText extends StatelessWidget {
  const MoleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, // Alineación del texto "MOLE" centrado
      child: Text(
        'MOLE',
        style: TextStyle(
          fontSize: 108,
          fontWeight: FontWeight.bold,
          color: Color(0xFF3CF4FF),
          letterSpacing: 1.5,
          fontFamily: 'Montserrat',
          height: 1,
        ),
      ),
    );
  }
}
