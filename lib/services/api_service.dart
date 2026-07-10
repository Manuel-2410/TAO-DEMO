import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl =
      'https://tao-api-tg5c.onrender.com';

  Future<List<dynamic>> getAgentes() async {

    final response = await http.get(
      Uri.parse('$baseUrl/agentes'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception('Error obteniendo agentes');
  }
}