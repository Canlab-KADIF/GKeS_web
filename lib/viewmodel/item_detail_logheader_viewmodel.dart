import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;

class ItemDetailLogHeaderViewModel extends ChangeNotifier {
    final service.IJsonService _jsonService;

    ItemDetailLogHeaderViewModel(this._jsonService);

    String? _record_date;
    double? _duration;
    List<Map<String, String>>? _topic_list;

    bool? _is_loading;
    String? _error;

    String? get record_date => _record_date;
    String? get duration => _duration?.toString();
    List<Map<String, String>>? get topic_list => _topic_list;

    bool? get is_loading => _is_loading;
    String? get error => _error;

    Future<void> setLogHeader(String meta_data_path) async {
        _is_loading = true;
        _error = null;
        notifyListeners();

        try {
            final meta_data = await _jsonService.getJson(meta_data_path);
            _setLogHeader(meta_data);
        } catch (e) {
            print(e);
            _error = e.toString();
        } finally {
            _is_loading = false;
            notifyListeners();
        }
    }

    void _setLogHeader(Map<String, dynamic> meta_data) {
        final log_header = meta_data['log_header'];
        _record_date = _formatRecordDate(log_header['record_date']);
        _duration = _formatDuration(log_header['duration']);
        _topic_list = (log_header['topic_list'] as List<dynamic>)
            .map((e) => (e as Map<String, dynamic>).map((k, v) => MapEntry(k.toString(), v.toString())))
            .toList();
    }

    String _formatRecordDate(String record_date) {
        // "20250313_204505"
        if (record_date.length != 15 || !record_date.contains('_')) return record_date; // 잘못된 형식은 그대로 반환

        final datePart = record_date.substring(0, 8); // "20250313"
        final timePart = record_date.substring(9);    // "204505"

        final year = datePart.substring(0, 4);
        final month = datePart.substring(4, 6);
        final day = datePart.substring(6, 8);

        final hour = timePart.substring(0, 2);
        final minute = timePart.substring(2, 4);
        final second = timePart.substring(4, 6);

        return "$year-$month-$day $hour:$minute:$second";;
    }

    double _formatDuration(dynamic duration) {
        final parsed = double.parse(duration.toString());
        return double.parse(parsed.toStringAsFixed(2));
    }
}

