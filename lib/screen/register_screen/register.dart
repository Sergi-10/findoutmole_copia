import 'package:findoutmole/screen/register_screen/cuentraPrevia.dart';
import 'package:flutter/material.dart';
import 'package:findoutmole/screen/register_screen/confirmar_Contraseña.dart';
import 'package:findoutmole/screen/register_screen/contraseña.dart';
import 'package:findoutmole/screen/register_screen/email.dart';
import 'package:findoutmole/screen/register_screen/nombre_de_usuario.dart';
import 'package:findoutmole/screen/register_screen/registerButtom.dart';
import 'package:findoutmole/screen/register_screen/textoInicial.dart'; // Se mantiene el cambio aquí

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

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
                    const SizedBox(height: 50),
                    Image.asset('assets/images/lupaconojo.png', height: 100),
                    const SizedBox(height: 20),
                    const TextoInicial(), // Antes: Cuentaexiste()
                    const SizedBox(height: 20),
                    const NombreDeUsuario(),
                    const SizedBox(height: 20),
                    const EmailField(),
                    const SizedBox(height: 20),
                    PasswordField(controller: passwordController),
                    const SizedBox(height: 20),
                    ConfirmPasswordField(
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 20),
                    const RegisterButton(), // Se cierra correctamente el paréntesis aquí
                    const SizedBox(height: 20),
                    const CuentaExiste(), // Ensure the class name matches the one in cuentaExiste.dart
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
