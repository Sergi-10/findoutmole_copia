import 'package:flutter/material.dart';

Widget buildUsernameField() {
  return TextField(
    decoration: const InputDecoration(
      labelText: 'Nombre de usuario',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
    ),
  );
}