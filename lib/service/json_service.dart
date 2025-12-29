import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:abnormal_autonomous_web/service/i_json_service.dart';

class JsonService implements IJsonService {
  @override
  Future<Map<String, dynamic>> getJson(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load JSON from $url');
    }
  }
}
