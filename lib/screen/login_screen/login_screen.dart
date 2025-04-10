import 'package:findoutmole/screen/login_screen/text_find_out.dart';
import 'package:findoutmole/screen/login_screen/textfield_user.dart';
import 'package:flutter/material.dart';
import 'package:findoutmole/screen/login_screen/text_mole.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold proporciona la estructura visual básica de la app (barra superior, body, etc.)
      body: Stack(
        // Stack permite superponer widgets uno encima de otro
        children: [
          // Imagen de fondo ocupando toda la pantalla
          SizedBox.expand(
            // SizedBox.expand hace que el hijo (imagen) ocupe todo el espacio disponible
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),

          // Contenido encima de la imagen, protegido por SafeArea
          SafeArea(
            child: Column(
              // Organiza los widgets verticalmente
              crossAxisAlignment:
                  CrossAxisAlignment
                      .center, // Alinea el contenido de la columna a la izquierda (horizontalmente)
              children: [
                FindOutText(),

                MoleText(),

                // Espaciador grande para empujar hacia abajo el campo de usuario
                Expanded(child: SizedBox(height: 280)),

                // Campo de usuario
                TexfieldUsuarioPassw(
                  hintText: 'Usuario', // Texto dentro del campo
                  icon: Icons.person, // Icono de usuario
                  obscureText:
                      false, // Oculta el texto mientras se escribe (modo contraseña)
                ),

                SizedBox(height: 20), // Espacio entre campos
                // Campo de contraseña
                TexfieldUsuarioPassw(
                  hintText: 'Contraseña', // Texto dentro del campo
                  icon: Icons.lock, // Icono de candado
                  obscureText:
                      true, // Oculta el texto mientras se escribe (modo contraseña)
                ),

                SizedBox(
                  height: 30,
                ), // Espacio entre el campo de contraseña y el botón
                // Botón "Acceder"
                Padding(
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
                        // Acción al pulsar el botón
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
                ),

                SizedBox(
                  height: 10,
                ), // Espacio entre botón y texto "Recordar contraseña"
                // Texto "Recordar contraseña"
                Center(
                  child: Text(
                    'Recordar Contraseña',
                    style: TextStyle(
                      // Caracterisiticas texto
                      color: Colors.black87,
                      fontSize: 18, //Tamaño texto
                      decoration: TextDecoration.underline, //Subrayado Texto
                    ),
                  ),
                ),

                SizedBox(height: 5), // Espacio inferior antes de "crear cuenta"
                // Texto "Crear nuevo usuario"
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      'Nuevo Usuario',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


