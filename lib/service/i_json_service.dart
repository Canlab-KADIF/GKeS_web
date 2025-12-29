import 'package:flutter/services.dart';

abstract class IJsonService {
    Future<Map<String, dynamic>> getJson(String path);
}