import 'package:flutter/material.dart';
import 'package:findoutmole/screen/menu_screen/Perfil.dart'; // Pantalla de perfil
import 'package:findoutmole/screen/menu_screen/Formularios.dart'; // Pantalla de formularios

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FindOutMole'),
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
                        backgroundColor: Colors.white.withOpacity(0.8), // Fondo con transparencia
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        print('Agregar Archivos clicked!');
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
                        backgroundColor: Colors.white.withOpacity(0.8), // Fondo con transparencia
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
                              nombre: 'Nombre no definido', // Valor predeterminado
                              apellidos: 'Apellidos no definidos', // Valor predeterminado
                              email: 'Correo no definido', // Valor predeterminado
                              edad: 'Edad no definida', // Valor predeterminado
                              peso: 'Peso no definido', // Valor predeterminado
                              telefono: 'Teléfono no definido', // Valor predeterminado
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
                        backgroundColor: Colors.white.withOpacity(0.8), // Fondo con transparencia
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
                        backgroundColor: Colors.white.withOpacity(0.8), // Fondo con transparencia
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        print('Contacto clicked!');
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
                    // Botón 5: Formularios
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.8), // Fondo con transparencia
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormulariosPage(), // Navega a la pantalla de formularios
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment, size: 40),
                          SizedBox(height: 8),
                          Text('Formularios'),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '© 2025 FindOutMole. Todos los derechos reservados.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white), // Texto visible sobre fondo
          ),
        ), // Fondo semitransparente
      ),
    );
  }
}