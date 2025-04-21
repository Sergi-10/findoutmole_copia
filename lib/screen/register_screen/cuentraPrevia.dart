import 'package:findoutmole/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class CuentaExiste extends StatelessWidget {
  const CuentaExiste({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega a la pantalla de inicio de sesión
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ), // Enlace a LoginPage
        );
      },
      child: const Text(
        '¿Ya tienes cuenta? Inicia sesión',
        style: TextStyle(color: Colors.white, fontSize: 18), 
      ),
    );
  }
}
