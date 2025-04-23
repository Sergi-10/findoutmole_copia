import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {

  final TextEditingController controller;

  const EmailField({
  super.key,
  required this.controller
  });

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String _email = ''; // Estado para almacenar el correo electrónico
  String?
  _errorText; // Mensaje de error si el correo no cumple con los requisitos

  // Función para validar el correo electrónico
  void _validateEmail(String value) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ); // Expresión regular para validar correos
    if (value.isEmpty) {
      setState(() {
        _errorText = 'El correo electrónico no puede estar vacío';
        _email = ''; // No guarda el correo
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText = 'Por favor, ingresa un correo electrónico válido';
        _email = ''; // No guarda el correo
      });
    } else {
      setState(() {
        _errorText = null; // No hay error
        _email = value; // Guarda el correo solo si es válido
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
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ).withOpacity(0.3), // Color inicial con transparencia
                const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ).withOpacity(0.5), // Color final con más transparencia
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ).withOpacity(0.1), // Sombra ligera
                blurRadius: 8.0, // Difuminado de la sombra
                offset: const Offset(0, 4), // Desplazamiento de la sombra
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller, //modificado por JB
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              labelStyle: const TextStyle(
                color: Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ), // Color del texto del label
                fontWeight: FontWeight.bold, // Negrita para el label
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                borderSide: BorderSide.none, // Sin borde visible
              ),
              prefixIcon: const Icon(
                Icons.email,
                color: Color.fromARGB(255, 255, 255, 255),
              ), // Ícono con color blanco
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
                _email = value; // Actualiza el estado con el nuevo valor
                _validateEmail(_email); // Valida el correo electrónico
              });
            }, // Valida el texto mientras se escribe
          ),
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
