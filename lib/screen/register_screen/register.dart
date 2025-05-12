import 'package:findoutmole/screen/register_screen/condiciones.dart';
import 'package:findoutmole/screen/register_screen/cuentraPrevia.dart';
import 'package:flutter/material.dart';
import 'package:findoutmole/screen/register_screen/confirmar_Contraseña.dart';
import 'package:findoutmole/screen/register_screen/contraseña.dart';
import 'package:findoutmole/screen/register_screen/email.dart';
import 'package:findoutmole/screen/register_screen/registerButtom.dart';
import 'package:findoutmole/screen/register_screen/textoInicial.dart';
import 'package:findoutmole/screen/FootBar.dart'; // Importa el pie de página

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controladores para los campos de texto
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool aceptoCondiciones = false; // Estado para los términos y condiciones

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Image.asset('assets/images/lupaconojo.png', height: screenHeight * 0.15),
                    SizedBox(height: screenHeight * 0.03),
                    const TextoInicial(),
                    SizedBox(height: screenHeight * 0.03),
                    // Campo de correo electrónico
                    EmailField(controller: emailController),
                    SizedBox(height: screenHeight * 0.03),
                    // Campo de contraseña
                    PasswordField(controller: passController),
                    SizedBox(height: screenHeight * 0.03),
                    // Campo de confirmación de contraseña
                    ConfirmPasswordField(
                    controller: confirmPassController,
                    passwordController: passController, // Añade el controlador de la contraseña
),
                    SizedBox(height: screenHeight * 0.03),
                    // Checkbox de términos y condiciones
                    Condiciones(
                      onChanged: (valor) {
                        setState(() {
                          aceptoCondiciones = valor;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Botón de registro
                    RegisterButton(
                      passwordController: passController,
                      emailController: emailController,
                      confirmPasswordController: confirmPassController,
                      enabled: aceptoCondiciones,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Texto para usuarios con cuenta existente
                    const CuentaExiste(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterBar(),
    );
  }

  @override
  void dispose() {
    // Libera los controladores al destruir el widget
    passController.dispose();
    emailController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
