import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/services/api_service.dart';
import '/models/prediction.dart';
// Importa la pantalla de carpetas
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ConsultasScreen extends StatefulWidget {
  final String token;

  const ConsultasScreen({required this.token, super.key});

  @override
  _ConsultasScreenState createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  List<Prediction> _diagnostics = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchDiagnostics();
  }

  Future<void> _fetchDiagnostics() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final diagnostics = await ApiService().getDiagnostics(widget.token);
      setState(() {
        _diagnostics = diagnostics;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteDiagnostic(String diagnosticId) async {
    try {
      await ApiService().deleteDiagnostic(diagnosticId, widget.token);
      setState(() {
        _diagnostics.removeWhere((diag) => diag.diagnosticId == diagnosticId);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diagnóstico eliminado correctamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar diagnóstico: $e')),
      );
    }
  }

  void _showDiagnosticDetails(Prediction diagnostic) {
    showDialog(
      context: context,
      builder: (context) => _buildDiagnosticDetailsDialog(diagnostic),
    );
  }

  Widget _buildDiagnosticDetailsDialog(Prediction diagnostic) {
    return AlertDialog(
      title: Text(
        diagnostic.prediction,
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (diagnostic.imageUrl != null)
              Container(
                constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
                child: Image.network(
                  diagnostic.imageUrl!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              'Probabilidades:',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...diagnostic.probabilities.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        entry.key,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                    Text(
                      '${entry.value.toStringAsFixed(2)}%',
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cerrar',
            style: GoogleFonts.poppins(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }

  void _confirmDeleteDiagnostic(String diagnosticId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirmar eliminación',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          '¿Estás seguro de que deseas eliminar este diagnóstico?',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteDiagnostic(diagnosticId);
            },
            child: Text(
              'Eliminar',
              style: GoogleFonts.poppins(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _openCarpetasScreen(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarpetasScreen(imagePath: imagePath),
      ),
    );
  }

  Widget _buildDiagnosticCard(Prediction diagnostic) {
    return InkWell(
      onTap: () => _showDiagnosticDetails(diagnostic),
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen del diagnóstico
              if (diagnostic.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    diagnostic.imageUrl!,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 36,
                    ),
                  ),
                )
              else
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              const SizedBox(width: 8),
              // Información del diagnóstico
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      diagnostic.prediction,
                      style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Tipo: ${diagnostic.type}',
                      style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      diagnostic.timestamp != null
                          ? DateFormat('dd/MM/yyyy HH:mm').format(diagnostic.timestamp!)
                          : 'Sin fecha',
                      style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Botones de acción
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red, size: 16),
                    onPressed: () => _confirmDeleteDiagnostic(diagnostic.diagnosticId!),
                  ),
                  IconButton(
                    icon: const Icon(Icons.folder, color: Colors.blueAccent, size: 16),
                    onPressed: () => _openCarpetasScreen(context, diagnostic.imageUrl ?? ''),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historial de Diagnósticos',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/2.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Contenido
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _errorMessage!,
                            style: GoogleFonts.poppins(color: Colors.red, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _fetchDiagnostics,
                            child: Text('Reintentar', style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    )
                  : _diagnostics.isEmpty
                      ? Center(
                          child: Text(
                            'No hay diagnósticos disponibles',
                            style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[600]),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          itemCount: _diagnostics.length,
                          itemBuilder: (context, index) {
                            return _buildDiagnosticCard(_diagnostics[index]);
                          },
                        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () => _openCarpetasScreen(context, ''),
              child: const Text('Crear Carpeta'),
            ),
          ),
        ],
      ),
    );
  }
}

class CarpetasScreen extends StatefulWidget {
  final String? imagePath; // Ruta de la imagen que se desea guardar (puede ser null)

  const CarpetasScreen({this.imagePath, super.key});

  @override
  _CarpetasScreenState createState() => _CarpetasScreenState();
}

class _CarpetasScreenState extends State<CarpetasScreen> {
  List<String> _folders = []; // Lista de carpetas

  @override
  void initState() {
    super.initState();
    _loadFolders(); // Cargar las carpetas existentes al iniciar
  }

  Future<void> _loadFolders() async {
    final directory = await getApplicationDocumentsDirectory();
    final folderPath = directory.path;

    final folderDirectory = Directory(folderPath);
    final folders = folderDirectory
        .listSync()
        .whereType<Directory>()
        .map((entity) => entity.path.split('/').last)
        .toList();

    setState(() {
      _folders = folders;
    });
  }

  Future<void> _createFolder(String folderName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final folderPath = '${directory.path}/$folderName';
      final folder = Directory(folderPath);

      if (!folder.existsSync()) {
        folder.createSync(recursive: true);
        setState(() {
          _folders.add(folderName); // Agregar la nueva carpeta a la lista
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Carpeta "$folderName" creada')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('La carpeta "$folderName" ya existe')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear la carpeta: $e')),
      );
    }
  }

  Future<void> _saveImageToFolder(String folderName) async {
    if (widget.imagePath == null || widget.imagePath!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay imagen para guardar')),
      );
      return;
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final folderPath = '${directory.path}/$folderName';
      final folder = Directory(folderPath);

      if (!folder.existsSync()) {
        folder.createSync(recursive: true);
      }

      final imageFile = File(widget.imagePath!);
      final newImagePath = '$folderPath/${imageFile.uri.pathSegments.last}';
      await imageFile.copy(newImagePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imagen guardada en $folderName')),
      );

      Navigator.pop(context); // Regresa a la pantalla anterior
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la imagen: $e')),
      );
    }
  }

  void _showCreateFolderDialog() {
    final TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Crear nueva carpeta'),
        content: TextField(
          controller: folderNameController,
          decoration: const InputDecoration(
            hintText: 'Nombre de la carpeta',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final folderName = folderNameController.text.trim();
              if (folderName.isNotEmpty) {
                _createFolder(folderName);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('El nombre de la carpeta no puede estar vacío')),
                );
              }
            },
            child: const Text('Crear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Carpeta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.create_new_folder),
            onPressed: _showCreateFolderDialog, // Abre el diálogo para crear una carpeta
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selecciona una carpeta para guardar la imagen:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas
                  crossAxisSpacing: 16, // Espaciado horizontal
                  mainAxisSpacing: 16, // Espaciado vertical
                ),
                itemCount: _folders.length,
                itemBuilder: (context, index) {
                  final folder = _folders[index];
                  return InkWell(
                    onTap: () => _saveImageToFolder(folder), // Guarda la imagen en la carpeta seleccionada
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1), // Fondo de la carpeta
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder,
                            size: 50,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            folder,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}