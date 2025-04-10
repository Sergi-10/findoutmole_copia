import 'package:flutter/material.dart';

class TexfieldUsuarioPassw extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;

  const TexfieldUsuarioPassw({
    this.hintText = '',
    this.icon = Icons.person,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 200),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          // Constructor que indica que el borde sea de tipo contorno. Dentro del constructor se define aspecto del borde
          prefixIcon: Icon(icon), // Icono de usuario
          hintText:
              hintText, // Texto dentro del campo // Oculta el texto mientras se escribe (modo contraseña)
          filled: true, // Activa el fondo del campo de texto
          fillColor: const Color.fromRGBO(
            255,
            255,
            255,
            0.9,
          ), // Blanco con 90% opacidad
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
          ), // Altura del campo
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ), // Bordes redondeados con radio 30
            borderSide: BorderSide.none, // Sin borde visible
          ),
        ),
      ),
    );
  }
}
