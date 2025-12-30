import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:abnormal_autonomous_web/service/i_item_service.dart';

class ItemService implements IItemService {
    final String _baseUrl = 'http://127.0.0.1:8000/api/search';

    @override
    Future<Map<String, dynamic>> searchItems({
        Map<String, List<int>>? filters,
        int? page,
    }) async {
        final queryString = _buildQueryString(filters);
        final uri = Uri.parse('$_baseUrl?$queryString&page=$page');
        final response = await http.get(uri);
    
        if (response.statusCode == 200) {
            return jsonDecode(response.body);
        } else {
            throw Exception('Failed to fetch items');
        }
    }

    String _buildQueryString(Map<String, List<int>>? filters) {
        if (filters == null) return '';

        final queryParts = <String>[];

        filters.forEach((key, values) {
            for (var value in values) {
                queryParts.add('$key=$value');
            }
        });

        return queryParts.join('&');
    }
}