import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: () {
          // Aquí puedes agregar la lógica para registrar al usuario
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: _isPressed
                  ? [
                      Color(0xFF5EE2EC),
                      Color(0xFF478DE0),
                    ] // Colores más claros al presionar
                  : [
                      Color(0xFF4DD0E1),
                      Color(0xFF1976D2),
                    ], // Normal
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: const Center(
            child: Text(
              'Registrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
