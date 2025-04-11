import 'package:flutter/material.dart';

class NombreDeUsuario extends StatefulWidget {
  const NombreDeUsuario({super.key});

  @override
  _NombreDeUsuarioState createState() => _NombreDeUsuarioState();
}

class _NombreDeUsuarioState extends State<NombreDeUsuario> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  // Función para validar el nombre de usuario
  void _validateUsername(String value) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9]{6,}$'); // Solo letras y números, mínimo 6 caracteres
    if (value.isEmpty) {
      setState(() {
        _errorText = 'El nombre de usuario no puede estar vacío';
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText =
            'Debe tener al menos 6 caracteres y no contener caracteres especiales';
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
          decoration: InputDecoration(
            labelText: 'Nombre de usuario',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.person),
          ),
          onChanged: _validateUsername, // Valida el texto mientras se escribe
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