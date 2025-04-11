import 'package:findoutmole/screen/register_screen/confirmar_Contraseña.dart';
import 'package:findoutmole/screen/register_screen/cuentraPrevia.dart';
import 'package:findoutmole/screen/register_screen/email.dart';
import 'package:findoutmole/screen/register_screen/registerButtom.dart';
import 'package:findoutmole/screen/register_screen/textoInicial.dart';
import 'package:flutter/material.dart';
import 'nombre_de_usuario.dart';
import 'contraseña.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController =
        TextEditingController(); // Controlador para la contraseña principal

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Cuentaexiste(),
                    const SizedBox(height: 20),
                    const NombreDeUsuario(),
                    const SizedBox(height: 20),
                    const EmailField(),
                    const SizedBox(height: 20),
                    PasswordField(
                      controller: passwordController,
                    ), // Pasa el controlador
                    const SizedBox(height: 20),
                    ConfirmPasswordField(
                      passwordController: passwordController,
                    ), // Pasa el controlador
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para registrar al usuario
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                      child: const RegisterButton(),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        // Redirigir al usuario a la página de inicio de sesión
                      },
                      child: cuentaexiste(),
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

