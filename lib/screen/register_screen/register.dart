import 'package:findoutmole/screen/register_screen/confirmar_Contrase%C3%B1a.dart';
import 'package:flutter/material.dart';
import 'nombre_de_usuario.dart'; //importa la función de para el campo de usuario
import 'contraseña.dart'; // importa la función para el campo de contraseña

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        // Centra todo el contenido del body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra verticalmente
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centra horizontalmente
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Registro de Usuario',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                // Campo para el nombre de usuario
                buildUsernameField(),
                const SizedBox(height: 20),
                // Campo para el correo electrónico
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                // campo para la contraseña
                PasswordField(),
                const SizedBox(height: 20),
                //Campo para confirmar contraseña
                buildConfirmPasswordField(),
                const SizedBox(height: 20),
                // Botón para registrar
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para registrar al usuario
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ), // Botón de ancho completo
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Registrar'),
                ),
                const SizedBox(height: 10),
                // Opción para ir a la página de inicio de sesión
                TextButton(
                  onPressed: () {
                    // Aquí puedes redirigir al usuario a la página de inicio de sesión
                  },
                  child: const Text(
                    '¿Ya tienes cuenta? Inicia sesión',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
