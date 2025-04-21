import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoInicial extends StatelessWidget {
  const TextoInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Registro de Usuario',
      style: GoogleFonts.redHatDisplay(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 47, 90),
      ),
    );
  }
}
