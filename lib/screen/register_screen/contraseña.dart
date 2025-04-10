import 'package:flutter/material.dart';

TextField buildPasswordField() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Contraseña',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.lock),
    ),
  );
}
