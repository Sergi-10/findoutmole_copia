import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  String _password = ''; // Estado para almacenar la contraseña
  bool _isObscured = true; // Controla si el texto está oculto o visible
  String? _errorText; // Mensaje de error si la contraseña no cumple con los requisitos

  // Función para validar la contraseña
  void _validatePassword(String value) {
    final RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$'); // Expresión regular para validar la contraseña
    if (value.isEmpty) {
      setState(() {
        _errorText = 'La contraseña no puede estar vacía';
        _password = ''; // No guarda la contraseña
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText =
            'Debe tener al menos 6 caracteres, 1 letra mayúscula, 1 número y 1 carácter especial';
        _password = ''; // No guarda la contraseña
      });
    } else {
      setState(() {
        _errorText = null; // No hay error
        _password = value; // Guarda la contraseña solo si es válida
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados más pronunciados
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 253, 253, 253).withOpacity(0.3), // Color inicial con transparencia
                const Color.fromARGB(255, 251, 252, 252).withOpacity(0.5), // Color final con más transparencia
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 253, 253, 253).withOpacity(0.1), // Sombra ligera
                blurRadius: 8.0, // Difuminado de la sombra
                offset: const Offset(0, 4), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: TextField(
            obscureText: _isObscured, // Controla si el texto está oculto o visible
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), // Color del texto del label
                fontWeight: FontWeight.bold, // Negrita para el label
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                borderSide: BorderSide.none, // Sin borde visible
              ),
              prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 255, 255, 255)), // Ícono con color blanco
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 255, 255, 255), // Ícono con color blanco
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured; // Alterna entre ocultar y mostrar el texto
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 10.0,
              ), // Espaciado interno
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), // Color del texto ingresado
              fontSize: 16.0, // Tamaño del texto
            ),
            onChanged: _validatePassword, // Valida el texto mientras se escribe
          ),
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