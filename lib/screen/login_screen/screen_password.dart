// import 'package:findoutmole/screen/login_screen/screen_new_password.dart'; En un principio no es necesario
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenPassword extends StatefulWidget {
  const ScreenPassword({super.key});
  //Estructura principal del widget
  @override
  ScreenPasswordState createState() => ScreenPasswordState();
}

class ScreenPasswordState extends State<ScreenPassword> {
  final TextEditingController comprobacionCorreo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: configuracionAppBar(context),
      body: Stack(
        // Stack es un Contenedor que permite colocar varios widgets en la pantalla y que los widgets se suerpongan unos de otros.
        children: [
          imagenDeFondo(), // Metodo de configuracion de la imagen de fondo
          SafeArea(
            // SafeArea asegura que el contenido no se superponga a la barra de estado y la barra de navegación
            child: Padding(
              //
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: contenidoPagina(context),
            ),
          ),
        ],
      ),
    );
  }

  // AppBar transparente con botón de retroceso. Permite que el appBar sea transparente y que el contenido de la pantalla se vea detrás de ella.
  AppBar configuracionAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Login'),
      backgroundColor:
          Colors
              .transparent, // Al ponerlo en transparente, el AppBar se convierte en un widget vacío
      elevation:
          0, // Elimina la sombra del AppBar y que el contenido se pueda ver (se consigue junto a transparent)
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  // Imagen de fondo ocupando toda la pantalla
  Widget imagenDeFondo() {
    return SizedBox.expand(
      child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
    );
  }

  // Contenido del formulario de recuperación
  Widget contenidoPagina(BuildContext context) {
    //Metodos que configura el contenido
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        textoBienvenida1(),
        const SizedBox(height: 10), // Espacio entre widgets
        textoBienvenida2(),
        const SizedBox(height: 40),
        palabraCorreo(),
        const SizedBox(height: 8),
        campoCorreo(),
        const SizedBox(height: 20),
        botonEnviar(context),
      ],
    );
  }

  // Texto de bienvenida1
  Widget textoBienvenida1() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '¿No recuerdas tu contraseña?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Texto de bienvenida2
  Widget textoBienvenida2() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '¡No te preocupes, nos pasa a todos! Introduce tu correo y te ayudaremos.',
        style: TextStyle(color: Colors.white, fontSize: 14),
        textAlign: TextAlign.left,
      ),
    );
  }

  // Texto Correo electrónico
  Widget palabraCorreo() {
    return Container(
      alignment: Alignment.centerLeft, // Alinea a la izquierda
      child: const Text(
        'Correo',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Campo de texto para el correo electrónico
  Widget campoCorreo() {
    return TextField(
      controller: comprobacionCorreo,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        //Personlazacion del campo de texto
        filled: true,
        // ignore: deprecated_member_use
        fillColor: Colors.white.withOpacity(0.4),
        hintText: 'Ej: user@gmail.com',
        hintStyle: const TextStyle(color: Colors.black45),
        prefixIcon: const Icon(Icons.email, color: Colors.white),
        border: OutlineInputBorder(
          //Borde del campo de texto
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none, // Elimina el borde del campo de texto
        ),
      ),
      keyboardType:
          TextInputType
              .emailAddress, //Permite  que se incluya en el capo simbolos como @
    );
  }

  // Botón para enviar el correo
  Widget botonEnviar(BuildContext context) {
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
        onPressed: () => funcionalidadEnvio(context),
        // Configura el estilo del texto del mensaje
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

  //Funcionalidad del botón para enviar el correo
  void funcionalidadEnvio(BuildContext context) async {
    // Obtiene el correo ingresado y elimina los espacios en blanco
    final correo = comprobacionCorreo.text.trim();
    // Validación: campo vacío
    if (correo.isEmpty) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Campo vacío'),
              content: const Text(
                'Por favor, introduce tu correo electrónico.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
      );
      return;
    }

    // Validación: formato de correo inválido
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(correo)) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Correo no válido'),
              content: const Text(
                'Introduce un correo electrónico válido, por favor.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
      );
      return;
    }
    // Intento de envío del correo de recuperación
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: correo);
      // Diálogo de éxito
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Correo enviado'),
              content: const Text(
                'Te hemos enviado un correo para restablecer tu contraseña. Revisa tu bandeja de entrada.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cierra el diálogo
                    Navigator.pop(context); // Vuelve al login
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            ),
      );
    } catch (e) {
      // Diálogo de error
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(
                'Ocurrió un error al enviar el correo: ${e.toString()}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
      );
    }
  }
}
