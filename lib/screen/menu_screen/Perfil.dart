import 'package:findoutmole/screen/menu_screen/Formularios.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nombre;
  final String apellidos;
  final String email;
  final String edad;
  final String peso;
  final String telefono;

  const PerfilPage({
    super.key,
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.edad,
    required this.peso,
    required this.telefono,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Mi Perfil'),
  actions: [
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => FormulariosPage(), // Navega a la pantalla de formularios
            ),
          );
        },
    ),
  ],
),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Datos Guardados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Nombre: $nombre', style: TextStyle(fontSize: 16)),
            Text('Apellidos: $apellidos', style: TextStyle(fontSize: 16)),
            Text('Correo Electrónico: $email', style: TextStyle(fontSize: 16)),
            Text('Edad: $edad', style: TextStyle(fontSize: 16)),
            Text('Peso: $peso kg', style: TextStyle(fontSize: 16)),
            Text('Teléfono: $telefono', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}