import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller; // Agrega el controlador como parámetro

  const PasswordField({super.key, required this.controller}); // Constructor que recibe el controlador

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true; // Controla si el texto está oculto o visible
  String? _errorText; // Mensaje de error si la contraseña no cumple con los requisitos

  // Función para validar la contraseña
  void _validatePassword(String value) {
    final RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$'); // Expresión regular para validar la contraseña
    if (value.isEmpty) {
      setState(() {
        _errorText = 'La contraseña no puede estar vacía';
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText =
            'Debe tener al menos 6 caracteres, 1 letra mayúscula, 1 número y 1 carácter especial';
      });
    } else {
      setState(() {
        _errorText = null; // No hay error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller, // Usa el controlador recibido
          obscureText: _isObscured, // Controla si el texto está oculto o visible
          decoration: InputDecoration(
            labelText: 'Contraseña',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured; // Alterna entre ocultar y mostrar el texto
                });
              },
            ),
          ),
          onChanged: _validatePassword, // Valida el texto mientras se escribe
        ),
        if (_errorText != null) // Muestra un mensaje adicional si hay error
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