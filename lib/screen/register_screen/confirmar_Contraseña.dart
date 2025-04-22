import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final String password; // Recibe la contraseña principal para validación

  const ConfirmPasswordField({super.key, required this.password});

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  String _confirmPassword = '';
  bool _isObscured = true;
  String? _errorText;

  // Función para validar que las contraseñas coincidan
  void _validateConfirmPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorText = 'La confirmación de la contraseña no puede estar vacía';
      } else if (value != widget.password) {
        _errorText = 'Las contraseñas no coinciden';
      } else {
        _errorText = null; // No hay error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), // Fondo blanco transparente
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
          ),
          child: TextField(
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: 'Confirmar Contraseña',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 252, 252, 252),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none, // Sin borde visible
              ),
              prefixIcon: const Icon(
                Icons.lock, // Ícono de candado
                color: Color.fromARGB(255, 252, 252, 252),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 252, 251, 251),
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 10.0,
              ), // Espaciado interno
            ),
            style: const TextStyle(
              color: Colors.black, // Color del texto ingresado
              fontSize: 16.0, // Tamaño del texto
            ),
            onChanged: (value) {
              setState(() {
                _confirmPassword = value;
                _validateConfirmPassword(_confirmPassword);
              });
            },
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}