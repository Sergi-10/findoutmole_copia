import 'package:flutter/material.dart';
import 'package:findoutmole/screen/menu_screen/Perfil.dart';
import 'package:findoutmole/screen/FootBar.dart';
import 'package:findoutmole/screen/menu_screen/Contacto.dart';
import 'package:findoutmole/screen/menu_screen/prediction_screen.dart';
import 'package:findoutmole/screen/menu_screen/ConsultasScreen.dart';
import 'package:findoutmole/screen/login_screen/login_screen.dart';

class HomePage extends StatelessWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Extiende el cuerpo detrás de la barra de navegación superior
      appBar: configuracionAppBar(
        context,
      ), // LLamar metodo para configuración de la barra de navegación superior
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
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
                            builder:
                                (context) => PredictionScreen(token: token),
                          ),
                        );
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file, size: 40),
                          SizedBox(height: 8),
                          Text('Agregar Archivos'),
                        ],
                      ),
                    ),
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
                            builder: (context) => const PerfilPage(),
                          ),
                        );
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 40),
                          SizedBox(height: 8),
                          Text('Mi Perfil'),
                        ],
                      ),
                    ),
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
                            builder: (context) => ConsultasScreen(token: token),
                          ),
                        );
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 40),
                          SizedBox(height: 8),
                          Text('Consultas'),
                        ],
                      ),
                    ),
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
                            builder: (context) => const ContactoScreen(),
                          ),
                        );
                      },
                      child: const Column(
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
              const Spacer(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }

  // Método para configurar la barra de navegación superior
  AppBar configuracionAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Fondo transparente
      elevation: 0, // Sin sombra
      actions: [
        Tooltip(
          message: 'Cerrar sesión',
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ),
      ],
    );
  }
}
