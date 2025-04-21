import 'package:findoutmole/screen/register_screen/cuentraPrevia.dart';
import 'package:flutter/material.dart';
import 'package:findoutmole/screen/register_screen/confirmar_Contraseña.dart';
import 'package:findoutmole/screen/register_screen/contraseña.dart';
import 'package:findoutmole/screen/register_screen/email.dart';
import 'package:findoutmole/screen/register_screen/nombre_de_usuario.dart';
import 'package:findoutmole/screen/register_screen/registerButtom.dart';
import 'package:findoutmole/screen/register_screen/textoInicial.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    // Obtén las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // Espaciado dinámico
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05), // Espaciado dinámico
                    Image.asset('assets/images/lupaconojo.png', height: screenHeight * 0.15),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    const TextoInicial(),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    const NombreDeUsuario(),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    const EmailField(),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    PasswordField(controller: passwordController),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    ConfirmPasswordField(
                      passwordController: passwordController,
                    ),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    const RegisterButton(),
                    SizedBox(height: screenHeight * 0.03), // Espaciado dinámico
                    const CuentaExiste(),
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