import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../models/prediction.dart';

// Clase que gestiona la comunicación con el backend
class ApiService {
  // Base URL adaptable. Se define la direccion del backend dependiendo de si es web o movil.
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: kIsWeb ? 'http://127.0.0.1:8000' : 'http://10.0.2.2:8000',
  );

  // Metodo que envia una imagen al backend para obtener su predicción
  Future<Prediction> predict(dynamic imageData, String token) async {
    try {
      if (imageData == null) {
        throw Exception('No se proporcionó ninguna imagen');
      }

      print('Enviando solicitud a: $baseUrl/predict');
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/predict'),
      );
      request.headers['Authorization'] = 'Bearer $token';

      final xFile = imageData as XFile;

      if (kIsWeb) {
        // Flutter Web. Proceso que se ejecuta cuando corre la app en un navegador web
        final bytes =
            await xFile
                .readAsBytes(); // Leer bytes de la imagen. Es necesario xk Web no accede a la ruta del archivo
        if (bytes.isEmpty)
          throw Exception('No se pudieron leer los bytes de la imagen');

        String filename =
            xFile.name.isNotEmpty ? xFile.name : 'uploaded_image.jpg';
        String extension = path.extension(filename).toLowerCase();
        String mimeType = _getMimeType(extension);

        // Se adjunta el archivo como bytes, especificando nombre y tipo MIME
        request.files.add(
          http.MultipartFile.fromBytes(
            'file',
            bytes,
            filename: filename,
            contentType: http_parser.MediaType('image', mimeType),
          ),
        );
      } else {
        // Android o dispositivo físico. Obtiene la ruta del archivo de la imagen seleccionada
        final file = File(xFile.path);
        if (!file.existsSync())
          throw Exception('El archivo de imagen no existe: ${xFile.path}');

        String extension = path.extension(file.path).toLowerCase();
        String mime = _getMimeType(extension);
        // Adjunta el archivo directamente desde la ruta del dispositivo. . Se le pasa el nombre del archivo, la ruta y el tipo de contenido
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            file.path,
            contentType: http_parser.MediaType('image', mime),
          ),
        );
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('Respuesta del servidor: ${response.statusCode} - $responseBody');
      if (response.statusCode == 200) {
        return Prediction.fromJson(jsonDecode(responseBody));
      } else {
        throw Exception(jsonDecode(responseBody)['detail']);
      }
    } catch (e) {
      print('Error en ApiService.predict: $e');
      throw Exception('Error al realizar la predicción: $e');
    }
  }

  // Método que obtiene todos los diagnósticos del usuario autenticado
  Future<List<Prediction>> getDiagnostics(String token) async {
    try {
      print('Enviando solicitud a: $baseUrl/diagnostics');
      final response = await http.get(
        Uri.parse('$baseUrl/diagnostics'),
        headers: {
          'Authorization':
              'Bearer $token', // Se le pasa el token de acceso al servidor. Permite que backend reconozca al usuario
        },
      );

      print(
        'Respuesta del servidor: ${response.statusCode} - ${response.body}',
      );
      if (response.statusCode == 200) {
        //Obtiebne la lista de diagnósticos del servidor. Es decir, los datos de la imagen subida
        final data = jsonDecode(response.body);
        final diagnostics =
            (data['diagnostics'] as List)
                .map((item) => Prediction.fromJson(item))
                .toList();
        return diagnostics;
      } else {
        throw Exception('Error: ${jsonDecode(response.body)['detail']}');
      }
    } catch (e) {
      print('Error en ApiService.getDiagnostics: $e');
      throw Exception('Error al obtener diagnósticos: $e');
    }
  }

  // Metodo que elimina un diagnóstico específico usando su ID
  Future<void> deleteDiagnostic(String diagnosticId, String token) async {
    try {
      print('Enviando solicitud DELETE a: $baseUrl/diagnostics/$diagnosticId');
      final response = await http.delete(
        Uri.parse('$baseUrl/diagnostics/$diagnosticId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      print(
        'Respuesta del servidor: ${response.statusCode} - ${response.body}',
      );
      if (response.statusCode != 200) {
        throw Exception('Error: ${jsonDecode(response.body)['detail']}');
      }
    } catch (e) {
      print('Error en ApiService.deleteDiagnostic: $e');
      throw Exception('Error al eliminar diagnóstico: $e');
    }
  }

  // Metodo que devuelve el tipo de imagen dependiendo de la extension de la imagen, devuelve el tipo de imagen en formato string
  String _getMimeType(String extension) {
    switch (extension) {
      case '.jpg':
      case '.jpeg':
        return 'jpeg';
      case '.png':
        return 'png';
      case '.gif':
        return 'gif';
      case '.bmp':
        return 'bmp';
      default:
        return 'jpeg';
    }
  }
}
