import 'package:flutter/material.dart';

TextField buildLastNameField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Apellidos',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
    ),
  );
}