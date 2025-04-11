import 'package:findoutmole/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
// Importa la pantalla de inicio de sesión (LoginScreen).
// Asegúrate de tener la ruta correcta hacia el archivo 'login_screen.dart'
class cuentaexiste extends StatelessWidget {
  const cuentaexiste({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '¿Ya tienes cuenta? Inicia sesión',
      style: TextStyle(color: Colors.white),
    );
  }
}
