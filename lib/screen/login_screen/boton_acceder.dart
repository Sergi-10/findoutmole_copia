import 'package:findoutmole/screen/home_screen/home_screen.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Color(0xFF4DD0E1), Color(0xFF1976D2)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: TextButton(
          onPressed: () {
            final user = userController.text;
            final password = passwordController.text;

            if (user == 'admin' && password == 'admin') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreenPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Usuario o contraseña incorrectos')),
              );
            }
          },
          child: Text(
            'Acceder',
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