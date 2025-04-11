import 'package:flutter/material.dart'; // Importa el paquete de Flutter para usar widgets y herramientas de diseño.

class ConfirmPasswordField extends StatefulWidget { // Define un widget con estado para el campo de contraseña.
  const ConfirmPasswordField({super.key}); // Constructor de la clase, permite usar claves únicas para este widget.

  @override
  _PasswordFieldState createState() => _PasswordFieldState(); // Crea el estado asociado a este widget.
}

class _PasswordFieldState extends State<ConfirmPasswordField> { // Clase que maneja el estado del widget PasswordField.
  bool _isObscured = true; // Variable booleana que controla si el texto de la contraseña está oculto o visible.

  @override
  Widget build(BuildContext context) { // Método que construye el widget.
    return TextField( // Crea un campo de texto.
      obscureText: _isObscured, // Controla si el texto está oculto (contraseña) o visible.
      decoration: InputDecoration( // Configura la apariencia del campo de texto.
        labelText: 'Confirmar Contraseña', // Etiqueta que aparece dentro del campo de texto.
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
    );
  }
}