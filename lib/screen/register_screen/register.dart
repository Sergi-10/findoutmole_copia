import 'package:findoutmole/screen/register_screen/confirmar_Contraseña.dart'; // Para ConfirmPasswordField
import 'package:findoutmole/screen/register_screen/email.dart'; // Para EmailField
import 'package:flutter/material.dart';
import 'nombre_de_usuario.dart'; // Para NombreDeUsuario
import 'contraseña.dart'; // Para PasswordField

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador para la contraseña principal
    final TextEditingController passwordController = TextEditingController();

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
                    const NombreDeUsuario(),
                    const SizedBox(height: 20),
                    // Campo para el correo electrónico
                    const EmailField(),
                    const SizedBox(height: 20),
                    // Campo para la contraseña
                    PasswordField(controller: passwordController),
                    const SizedBox(height: 20),
                    // Campo para confirmar la contraseña
                    ConfirmPasswordField(passwordController: passwordController),
                    const SizedBox(height: 20),
                    // Botón para registrar
                    ElevatedButton(
                      onPressed: () {
                        // Aquí puedes agregar la lógica para registrar al usuario
                        // Por ejemplo, validar todos los campos antes de proceder
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue, // Cambia el color del botón
                      ),
                      child: const Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white), // Cambia el color del texto del botón
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Opción para ir a la página de inicio de sesión
                    TextButton(
                      onPressed: () {
                        // Aquí puedes redirigir al usuario a la página de inicio de sesión
                      },
                      child: const Text(
                        '¿Ya tienes cuenta? Inicia sesión',
                        style: TextStyle(color: Colors.white),
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