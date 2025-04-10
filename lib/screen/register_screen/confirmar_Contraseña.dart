import 'package:flutter/material.dart';

TextField buildConfirmPasswordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Confirmar Contraseña',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.lock),
    ),
  );
}