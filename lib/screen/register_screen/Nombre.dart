import 'package:flutter/material.dart';

TextField buildFirstNameField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Nombre',
      border: OutlineInputBorder(),
      prefixIcon: Icon(Icons.person),
    ),
  );
}