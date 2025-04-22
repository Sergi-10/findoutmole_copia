import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50, // Ajusta la altura según lo que necesites
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          border: Border(
            top: BorderSide.none, // Asegura que no haya borde superior
          ),
        ),
        child: Align(
          alignment: Alignment.center, // Centra el texto verticalmente
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '© 2025 FindOutMole. Todos los derechos reservados.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
