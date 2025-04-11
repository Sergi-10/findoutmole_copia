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
        TextField(
          controller: _confirmPasswordController,
          obscureText: _isObscured,
          decoration: InputDecoration(
            labelText: 'Confirmar Contraseña',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
          ),
          onChanged: _validateConfirmPassword,
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