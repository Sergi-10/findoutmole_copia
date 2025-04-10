import 'package:flutter/material.dart';

class BotonRecuperarContrasena extends StatelessWidget {
  const BotonRecuperarContrasena({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Recuperar Contraseña',
        style: TextStyle(
          // Caracterisiticas texto
          color: Colors.black87,
          fontSize: 18, //Tamaño texto
          decoration: TextDecoration.underline, //Subrayado Texto
        ),
      ),
    );
  }
}