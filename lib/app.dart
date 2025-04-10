import 'package:findoutmole/screen/login_screen/login_screen.dart';
import 'package:findoutmole/screen/register_screen/register.dart';
import 'package:flutter/material.dart';

// PANTALLA PARA HACER CAMBIOS EN LA APP
class AppHome extends StatelessWidget {
  const AppHome({super.key});
  
  get pageview => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: 
        const [ RegisterPage(),
        LoginPage(),
        ],
      ),
    );
  }
}
