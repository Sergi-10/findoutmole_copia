import 'package:flutter/material.dart';

class BotonNuevoUsuario extends StatelessWidget {
  const BotonNuevoUsuario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Text(
          'Nuevo Usuario',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}