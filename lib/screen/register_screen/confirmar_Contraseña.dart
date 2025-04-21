import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController passwordController; // Controlador de la contraseña principal

  const ConfirmPasswordField({super.key, required this.passwordController}); // Constructor que recibe el controlador

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObscured = true;
  String? _errorText;

  // Función para validar que las contraseñas coincidan
  void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorText = 'La confirmación de la contraseña no puede estar vacía';
      });
    } else if (value != widget.passwordController.text) {
      setState(() {
        _errorText = 'Las contraseñas no coinciden';
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados más pronunciados
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 252, 252, 252).withOpacity(0.3), // Color inicial con transparencia
                const Color.fromARGB(255, 246, 246, 247).withOpacity(0.5), // Color final con más transparencia
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
            controller: _confirmPasswordController,
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: 'Confirmar Contraseña',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 253, 253, 253), // Color del texto del label
                fontWeight: FontWeight.bold, // Negrita para el label
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                borderSide: BorderSide.none, // Sin borde visible
              ),
              prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 252, 252, 252)), // Ícono con color azul
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 255, 255, 255), // Ícono con color azul
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
              color: Colors.black, // Color del texto ingresado
              fontSize: 16.0, // Tamaño del texto
            ),
            onChanged: _validateConfirmPassword,
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