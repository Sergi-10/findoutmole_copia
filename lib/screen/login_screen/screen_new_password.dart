//No se utiliza esta clase. Comentada

/*
import 'package:flutter/material.dart';
import 'package:findoutmole/screen/login_screen/login_screen.dart';

class ScreenNewPassword extends StatefulWidget {
  const ScreenNewPassword({super.key});

  @override
  ScreenNewPasswordState createState() => ScreenNewPasswordState();
}

class ScreenNewPasswordState extends State<ScreenNewPassword> {
  // Controladores de texto para los campos de contraseña
  final TextEditingController controladorContrasena1 = TextEditingController();
  final TextEditingController controladorContrasena2 = TextEditingController();

  bool mostrarContrasena1 = false;
  bool mostrarContrasena2 = false;

  //Estructura principal del widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: configuracionAppBar(context),
      body: Stack(
        children: [
          imagenDeFondo(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: contenidoPagina(context),
            ),
          ),
        ],
      ),
    );
  }

  AppBar configuracionAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Introduce tu correo'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget imagenDeFondo() {
    return IgnorePointer(
      child: SizedBox.expand(
        child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget contenidoPagina(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        textoNuevaContrasena1(),
        const SizedBox(height: 5),
        campoContrasena1(),
        const SizedBox(height: 40),
        textoNuevaContrasena2(),
        const SizedBox(height: 5),
        campoContrasena2(),
        const SizedBox(height: 20),
        botonEnviar(),
        const SizedBox(height: 20),
      ],
    );
  }

  // Texto nueva contraseña 1
  Widget textoNuevaContrasena1() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Introduce una nueva contraseña',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget campoContrasena1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controladorContrasena1,
          obscureText: !mostrarContrasena1,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            // ignore: deprecated_member_use
            fillColor: Colors.white.withOpacity(0.4),
            hintText: 'Nueva contraseña',
            hintStyle: const TextStyle(color: Colors.black45),
            prefixIcon: const Icon(Icons.lock, color: Colors.white),
            suffixIcon: IconButton(
              icon: Icon(
                mostrarContrasena1 ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  mostrarContrasena1 = !mostrarContrasena1;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Debe contener mínimo 8 caracteres, una mayúscula, un número y un símbolo.',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  // Texto nueva contraseña 2
  Widget textoNuevaContrasena2() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Repite la nueva contraseña',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Campo contraseña 2
  Widget campoContrasena2() {
    return TextField(
      controller: controladorContrasena2,
      obscureText: !mostrarContrasena2,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        // ignore: deprecated_member_use
        fillColor: Colors.white.withOpacity(0.4),
        hintText: 'Repite nueva contraseña',
        hintStyle: const TextStyle(color: Colors.black45),
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            mostrarContrasena1 ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              mostrarContrasena2 = !mostrarContrasena2;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Botón enviar
  Widget botonEnviar() {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40), // ancho visual
        ),
        onPressed: logicaCambioContrasena,
        child: const Text(
          'Enviar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Lógica para el cambio de contraseña
  void logicaCambioContrasena() {
    final contra1 = controladorContrasena1.text;
    final contra2 = controladorContrasena2.text;

    // Comprobacion inclusion de al menos: un número, una letra mayúscula un símbolo y longitud minima de 8 caracteres
    final RegExp contraSegura = RegExp(
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$',
    );
    if (!contraSegura.hasMatch(contra1)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'La contraseña debe tener al menos 6 caracteres, una mayúscula, un número y un carácter especial',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Comprobación de campos vacíos
    if (contra1.isEmpty || contra2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, rellena ambos campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Comprobación de que las contraseñas coinciden
    if (contra1 != contra2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Todo correcto
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Contraseña cambiada correctamente'),
        backgroundColor: Colors.green,
      ),
    );

    // Redireccion a la pantalla de login
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }
}
*/
