import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:abnormal_autonomous_web/service/i_filter_service.dart';

class FilterService implements IFilterService {
    @override
    Future<List<Map<String, dynamic>>> fetchAllFilters() async {
        // 서버에 요청
        final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/filter_list'));
        if (response.statusCode == 200) {
            return List<Map<String, dynamic>>.from(jsonDecode(response.body));
        } else {
            throw Exception('Failed to fetch filters');
        }
    }
}