import 'package:flutter/material.dart';
import 'package:findoutmole/screen/FootBar.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const FooterBar(),
      backgroundColor: const Color.fromARGB(255, 118, 198, 232),
      appBar: AppBar(title: Text('Contacto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Necesitas ayuda?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Puedes ponerte en contacto con nosotros a través de los siguientes medios:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),

            Row(
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 10),
                Text('contacto@miapp.com', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.phone, color: Colors.green),
                SizedBox(width: 10),
                Text('+34 848 233 111', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 10),
                Text(
                  'Calle Falsa, 123 - Majarromaque,España',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 30),
            Center(
              child: Text(
                'Gracias por usar nuestra app maquina ❤️',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
