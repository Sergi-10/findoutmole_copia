import 'package:flutter/material.dart';

TextField buildUsernameField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Nombre de usuario',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
    ),
  );
}