import 'package:flutter/material.dart'; // Importa el paquete de Flutter para usar widgets y herramientas de diseño.

class PasswordField extends StatefulWidget { // Define un widget con estado para el campo de contraseña.
  const PasswordField({super.key}); // Constructor de la clase, permite usar claves únicas para este widget.

  @override
  _PasswordFieldState createState() => _PasswordFieldState(); // Crea el estado asociado a este widget.
}

class _PasswordFieldState extends State<PasswordField> { // Clase que maneja el estado del widget PasswordField.
  bool _isObscured = true; // Variable booleana que controla si el texto de la contraseña está oculto o visible.
  final TextEditingController _controller = TextEditingController(); // Controlador para el campo de texto.
  String? _errorText; // Variable para almacenar el mensaje de error.

  // Función para validar la contraseña
  void _validatePassword(String value) {
    final RegExp regex = RegExp(
        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{7,}$'); // Expresión regular para validar la contraseña.
    if (value.isEmpty) {
      setState(() {
        _errorText = 'La contraseña no puede estar vacía';
      });
    } else if (!regex.hasMatch(value)) {
      setState(() {
        _errorText =
            'La contraseña debe tener al menos 7 carácteres, una letra mayúscula, un número y un carácter especial';
      });
    } else {
      setState(() {
        _errorText = null; // No hay error
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Método que construye el widget.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField( // Crea un campo de texto.
          controller: _controller,
          obscureText: _isObscured, // Controla si el texto está oculto (contraseña) o visible.
          decoration: InputDecoration( // Configura la apariencia del campo de texto.
            labelText: 'Contraseña', // Etiqueta que aparece dentro del campo de texto.
            border: const OutlineInputBorder(), // Agrega un borde alrededor del campo de texto.
            prefixIcon: const Icon(Icons.lock), // Agrega un ícono de candado al inicio del campo de texto.
            suffixIcon: IconButton( // Agrega un botón al final del campo de texto.
              icon: Icon( // Define el ícono del botón.
                _isObscured ? Icons.visibility : Icons.visibility_off, // Cambia el ícono según el estado (_isObscured).
              ),
              onPressed: () { // Define la acción al presionar el botón.
                setState(() { // Actualiza el estado del widget.
                  _isObscured = !_isObscured; // Alterna entre ocultar y mostrar el texto.
                });
              },
            ),
          ),
          onChanged: _validatePassword, // Valida el texto mientras se escribe.
        ),
        if (_errorText != null) // Muestra un mensaje adicional si hay error.
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