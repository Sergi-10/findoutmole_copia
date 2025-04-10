import 'package:flutter/material.dart';

class BotonAcceder extends StatelessWidget {
  const BotonAcceder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Color(0xFF4DD0E1), Color(0xFF1976D2)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: TextButton(
          onPressed: () {
            // Acción al pulsar el botón
          },
          child: Text(
            'Acceder',
            style: TextStyle(
              color: Colors.white, // Color del texto del botón
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}