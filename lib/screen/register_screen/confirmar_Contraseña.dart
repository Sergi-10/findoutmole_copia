import 'package:flutter/material.dart';

Widget buildConfirmPasswordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Confirmar Contraseña',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.lock),
    ),
  );
}