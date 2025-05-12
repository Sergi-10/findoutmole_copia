import 'package:findoutmole/screen/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController; // Controlador para la confirmación de contraseña
  final bool enabled;

  const RegisterButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController, // Añadido
    required this.enabled,
  });

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF4DD0E1), Color(0xFF1976D2)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: TextButton(
          onPressed: () async {
            final email = widget.emailController.text.trim();
            final password = widget.passwordController.text.trim();
            final confirmPassword = widget.confirmPasswordController.text.trim();

            // Validación de campos vacíos
            if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Correo, contraseña y confirmación son requeridos')),
              );
              return;
            }

            // Validación de coincidencia de contraseñas
            if (password != confirmPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Las contraseñas no coinciden')),
              );
              return;
            }

            // Validación de requisitos de contraseña
            final RegExp regex = RegExp(
              r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$',
            );

            if (password.length < 8 || !regex.hasMatch(password)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('La contraseña debe tener al menos 8 caracteres, una mayúscula, un número y un carácter especial'),
                ),
              );
              return;
            }

            // Verifica si la casilla de términos y condiciones está marcada
            if (!widget.enabled) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Debes aceptar los términos y condiciones'),
                ),
              );
              return;
            }

            try {
              // Registro del usuario en Firebase
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuario registrado con éxito')),
              );

              // Navega a la pantalla de inicio de sesión
              if (mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            } on FirebaseAuthException catch (e) {
              String errorMessage = 'Error al registrar usuario';

              if (e.code == 'email-already-in-use') {
                errorMessage = 'El correo ya está registrado';
              } else if (e.code == 'invalid-email') {
                errorMessage = 'El correo no es válido';
              } else if (e.code == 'weak-password') {
                errorMessage = 'La contraseña es muy débil';
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMessage)),
              );
            }
          },
          child: const Text(
            'Registrar',
            style: TextStyle(
              color: Colors.white, // Color del texto del botón
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
