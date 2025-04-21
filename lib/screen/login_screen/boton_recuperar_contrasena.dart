import 'package:findoutmole/screen/login_screen/screen_password.dart';
import 'package:flutter/material.dart';

class BotonRecuperarContrasena extends StatelessWidget {
  const BotonRecuperarContrasena({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity, // El botón ocupa todo el ancho disponible
        height: 50,
        child: TextButton(
          style: estiloBoton(), //Estilo Boton separado
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenPassword()),
          );
        }, //Accion boton separado
          child: const Text(
            'Recuperar contraseña',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Estilo boton
  ButtonStyle estiloBoton() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        Colors.transparent,
      ), // Fondo transparente
      overlayColor: WidgetStateProperty.all<Color>(
        // ignore: deprecated_member_use
        Colors.white.withOpacity(0.1), // Animación de onda al pulsar
      ),

      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(0),
      ), // Quita el relleno interno
    ); // Close ButtonStyle constructor
  }
}
