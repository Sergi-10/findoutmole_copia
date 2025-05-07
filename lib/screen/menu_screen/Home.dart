import 'package:flutter/material.dart';
import 'package:findoutmole/screen/menu_screen/Perfil.dart'; // Pantalla de perfil
import 'package:findoutmole/screen/FootBar.dart';
import 'package:findoutmole/screen/menu_screen/Archivos.dart'; // Pantalla de menu
import 'package:findoutmole/screen/menu_screen/Contacto.dart'; // Pantalla de contacto
import 'package:findoutmole/screen/login_screen/login_screen.dart'; // Pantalla de login
 // Pantalla de archivos

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: IconTheme.of(context).color,
            onPressed: () {
              Navigator.pushAndRemoveUntil( // Se cierra sesion borrando las rutas anteriores
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.png', // Ruta de la imagen
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Contenido principal
          Column(
            children: [
              Spacer(), // Espacio flexible para empujar los botones hacia abajo
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  shrinkWrap: true, // Hace que el GridView ocupe solo el espacio necesario
                  crossAxisCount: 2, // Dos columnas
                  crossAxisSpacing: 16, // Espaciado horizontal
                  mainAxisSpacing: 16, // Espaciado vertical
                  children: [
                    // Botón 1: Agregar Archivos
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArchivosScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file, size: 40),
                          SizedBox(height: 8),
                          Text('Agregar Archivos'),
                        ],
                      ),
                    ),
                    // Botón 2: Mi Perfil
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfilPage(

                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 40),
                          SizedBox(height: 8),
                          Text('Mi Perfil'),
                        ],
                      ),
                    ),
                    // Botón 3: Consultas
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        print('Consultas clicked!');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 40),
                          SizedBox(height: 8),
                          Text('Consultas'),
                        ],
                      ),
                    ),
                    // Botón 4: Contacto
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactoScreen(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.contact_mail, size: 40),
                          SizedBox(height: 8),
                          Text('Contacto'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), // Espacio flexible debajo de los botones
            ],
          ),
        ],
      ),
      bottomNavigationBar: FooterBar(),
    );
  }
}
