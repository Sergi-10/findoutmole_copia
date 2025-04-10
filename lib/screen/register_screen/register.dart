import 'package:flutter/material.dart';
import 'nombre_de_usuario.dart'; // Importa la función para el campo de usuario
import 'contraseña.dart'; // Importa la función para el campo de contraseña

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.png', // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Registro de Usuario',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Cambia el color del texto para que sea visible
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo para el nombre de usuario
                    buildUsernameField(),
                    const SizedBox(height: 20),
                    // Campo para el correo electrónico
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo para la contraseña
                    const PasswordField(),
                    const SizedBox(height: 20),
                    // Botón para registrar
                    ElevatedButton(
                      onPressed: () {
                        // Aquí puedes agregar la lógica para registrar al usuario
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
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
        ],
      ),
    );
  }
}