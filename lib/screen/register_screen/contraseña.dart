import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;
  String? _errorText;

  // Función para validar la contraseña
  void _validatePassword(String value) {
    final RegExp regex = RegExp(
      r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$',
    );

    setState(() {
      if (value.isEmpty) {
        _errorText = null; // No mostramos error si el campo está vacío
      } else if (!regex.hasMatch(value)) {
        _errorText =
            'Debe tener al menos 6 caracteres, 1 letra mayúscula, 1 número y 1 carácter especial';
      } else {
        _errorText = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Validamos desde el principio si ya hay algo escrito
    _validatePassword(widget.controller.text);

    widget.controller.addListener(() {
      _validatePassword(widget.controller.text);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {
      _validatePassword(widget.controller.text);
    });
    super.dispose();
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
                color: const Color.fromARGB(
                  255,
                  253,
                  253,
                  253,
                ).withOpacity(0.1),
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color.fromARGB(255, 255, 255, 255),
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
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16.0,
            ),
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
