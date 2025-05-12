import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller; // Controlador para la confirmación de contraseña
  final TextEditingController passwordController; // Controlador para la contraseña principal

  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  @override
  _ConfirmPasswordFieldState createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _isObscured = true;
  String? _errorText;

  // Validación visual de la confirmación de contraseña
  void _validateConfirmPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorText = 'La confirmación de la contraseña no puede estar vacía';
      } else if (value != widget.passwordController.text) {
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
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 253, 253, 253).withOpacity(0.3),
                const Color.fromARGB(255, 251, 252, 252).withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 253, 253, 253).withOpacity(0.1),
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller, // Controlador para la confirmación
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: 'Confirmar Contraseña',
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
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
              ),
              errorText: _errorText, // Muestra el error directamente en el campo
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
            onChanged: _validateConfirmPassword,
          ),
        ),
      ],
    );
  }
}
