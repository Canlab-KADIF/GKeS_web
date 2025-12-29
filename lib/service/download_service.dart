import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:abnormal_autonomous_web/service/i_download_service.dart';

class DownloadService implements IDownloadService {
    @override
    Future<Map<String, dynamic>> getDownloadList(String id) async {
        final response = await http.get(
            Uri.parse('http://127.0.0.1:8000/files/download?target_key=$id')
        );
        if (response.statusCode == 200) {
            return jsonDecode(response.body);
        } else {
            throw Exception('Failed to download package');
        }
    }
}

class PackageDownloadService implements IPackageDownloadService {
    @override
    Future<Map<String, dynamic>> packageDownload(String id) async {
        final Duration _timeout = const Duration(seconds: 600);

        final response = await http.get(
            Uri.parse('http://127.0.0.1:8000/files/download/pack?target_key=$id'),
        ).timeout(_timeout);
        if (response.statusCode == 200) {
            return jsonDecode(response.body);
        } else {
            throw Exception('Failed to download package');
        }
    }
}