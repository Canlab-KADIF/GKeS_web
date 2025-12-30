import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemUiData {
  final String image_path;
  final String video_path;
  final String meta_path;
  final String route_path;
  final List<String> filters;

  ItemUiData({
    required this.image_path,
    required this.video_path,
    required this.meta_path,
    required this.route_path,
    required this.filters,
  });

  factory ItemUiData.fromModel(model.ItemModel itemModel, List<model.FilterModel> filterModels) {
    List<String> filters = [];

    for (var entry in itemModel.filters.entries) {
      final key = entry.key;
      final value = entry.value;

      final filterModel = filterModels.firstWhere((fm) => fm.db_column == key, orElse: () => throw Exception("FilterModel not found for $key"));
      final isSpecialKey = _isSpecialKey(key);

      if (value is List) {
        for (var val in value) {
          final label = _mapEnumValue(filterModel, val);
          filters.add(_formatFilter(key, label, isSpecialKey));
        }
      } else {
        final label = _mapEnumValue(filterModel, value);
        filters.add(_formatFilter(key, label, isSpecialKey));
      }
    }

    return ItemUiData(
      image_path: itemModel.data_paths['image'] ?? '',
      video_path: itemModel.data_paths['video'] ?? '',
      meta_path: itemModel.data_paths['meta'] ?? '',
      route_path: itemModel.data_paths['route'] ?? '',
      filters: filters,
    );
  }

  static String _mapEnumValue(model.FilterModel filterModel, dynamic value) {
    if (value == null) return 'null';

    final entry = filterModel.enums.entries.firstWhere(
      (e) => e.key.toString() == value.toString(),
      orElse: () => throw Exception("Enum not found for value $value in ${filterModel.db_column}")
    );
    return entry.value;
  }

  static String _formatFilter(String key, String label, bool isSpecial) {
    if (isSpecial || label == "None" || label == "null") {
      return "$key $label";
    }
    return label;
  }

  static bool _isSpecialKey(String key) {
    const specialKeys = {"roundabouts", "cloudness", "wind", "rainfall", "snowfall"};
    return specialKeys.contains(key);
  }
}
