import 'package:flutter/material.dart';

class Correoelectronico extends StatelessWidget {
  const Correoelectronico({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        labelText: 'Correo electrónico',
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // Borde redondeado
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            30,
          ), // Borde redondeado al enfocar
          borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2),
        ),
      ),
    );
  }
}
