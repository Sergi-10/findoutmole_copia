/*import 'package:flutter/material.dart';
import 'package:findoutmole/screen/menu_screen/Perfil.dart'; // Importa la página de perfil
import 'package:findoutmole/screen/FootBar.dart'; // Importa el pie de página

class FormulariosPage extends StatefulWidget {
  const FormulariosPage({super.key});

  @override
  _FormulariosPageState createState() => _FormulariosPageState();
}

class _FormulariosPageState extends State<FormulariosPage> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellidos = '';
  String _email = '';
  String _edad = '';
  String _peso = '';
  String _telefono = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Formulario de Datos Personales'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 140),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField(
                            label: 'Nombre',
                            icon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu nombre';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _nombre = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            label: 'Apellidos',
                            icon: Icons.person_outline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tus apellidos';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _apellidos = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            label: 'Correo Electrónico',
                            icon: Icons.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu correo electrónico';
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return 'Por favor, ingresa un correo válido';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            label: 'Edad',
                            icon: Icons.cake,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu edad';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Por favor, ingresa un número válido';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _edad = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            label: 'Peso (kg)',
                            icon: Icons.fitness_center,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu peso';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Por favor, ingresa un número válido';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _peso = value!;
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            label: 'Teléfono',
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu número de teléfono';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _telefono = value!;
                            },
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF4DD0E1),
                                      Color(0xFF1976D2),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => PerfilPage(
                                                nombre: _nombre,
                                                apellidos: _apellidos,
                                                email: _email,
                                                edad: _edad,
                                                peso: _peso,
                                                telefono: _telefono,
                                              ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Enviar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.4),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}*/
