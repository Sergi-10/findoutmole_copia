import 'package:findoutmole/screen/menu_screen/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BotonAcceder extends StatelessWidget {
  final TextEditingController userController;
  final TextEditingController passwordController;

  const BotonAcceder({
    super.key,
    required this.userController,
    required this.passwordController,
  });

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
            final user = userController.text.trim();
            final password = passwordController.text.trim();

            try {
              // Intenta iniciar sesión con Firebase
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: user,
                password: password,
              );

              // Mostrar mensaje de bienvenida
              _mostrarDialogoBienvenida(context);
            } on FirebaseAuthException catch (e) {
              String errorMessage = 'Error al iniciar sesión';

              if (e.code == 'user-not-found') {
                errorMessage = 'No se encontró ningún usuario con ese correo';
              } else if (e.code == 'wrong-password') {
                errorMessage = 'Contraseña incorrecta';
              }

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(errorMessage)));
            }
          },
          child: const Text(
            'Acceder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // 👇 Función privada debajo de la clase, fuera del build
  void _mostrarDialogoBienvenida(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // No permitir cerrar tocando fuera
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Cierra el diálogo
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });

        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '¡Bienvenido a Find Out Mole!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
