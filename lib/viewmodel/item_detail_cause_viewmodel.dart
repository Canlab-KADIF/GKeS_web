import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;

class ItemDetailCauseViewModel extends ChangeNotifier {
    final service.IJsonService _jsonService;

    ItemDetailCauseViewModel(this._jsonService);

    String? _description;

    bool? _is_loading;
    String? _error;

    String? get description => _description;

    bool? get is_loading => _is_loading;
    String? get error => _error;


    Future<void> setDescription(String meta_data_path) async {
        _is_loading = true;
        _error = null;
        notifyListeners();

        try {
            final meta_data = await _jsonService.getJson(meta_data_path);
            _setDescription(meta_data);
        } catch (e) {
            _error = e.toString();
        } finally {
            _is_loading = false;
            notifyListeners();
        }
    }

    void _setDescription(Map<String, dynamic> metaData) {
        if (!metaData.containsKey('abnormal_driving_cause')) {
            _error = 'abnormal_driving_cause not found';
            return;
        }

        final cause = metaData['abnormal_driving_cause'];
        if (cause is! Map || !cause.containsKey('scenario')) {
            _error = 'scenario not found';
            return;
        }

        final scenario = cause['scenario'];
        if (scenario is! Map || !scenario.containsKey('description')) {
            _error = 'description not found';
            return;
        }

        _description = scenario['description']?.toString();
    }
}