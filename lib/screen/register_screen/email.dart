import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  _EmailFieldState createState() => _EmailFieldState(); 
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  // Función para validar el correo electrónico
  void _validateEmail(String value) {
    final RegExp regex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Expresión regular para validar correos
    if (value.isEmpty) {
      setState(() {
        _errorText = 'El correo electrónico no puede estar vacío';
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText = 'Por favor, ingresa un correo electrónico válido';
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
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.email),
          ),
          onChanged: _validateEmail, // Valida el texto mientras se escribe
        ),
        if (_errorText != null) // Muestra un mensaje adicional si hay error
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}