import 'package:flutter/material.dart';

TextField buildEmailField() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Correo electrónico',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.email),
    ),
  );
}