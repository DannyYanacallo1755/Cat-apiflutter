import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://http.cat";

  Future<List<Map<String, String>>> fetchHttpCatList() async {
    final List<String> statusCodes = ['100', '101', '200', '201', '202', '204', '301', '302', '303', '304', '400', '401', '403', '404', '500', '502', '503'];
    final List<Map<String, String>> httpCats = statusCodes.map((code) {
      return {
        'statusCode': code,
        'url': '$baseUrl/$code.jpg',
      };
    }).toList();

    return httpCats;
  }
}
