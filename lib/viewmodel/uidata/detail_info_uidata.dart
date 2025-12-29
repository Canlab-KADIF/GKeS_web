import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/view/common/functions.dart' as common_functions;

class DetailInfoUiData {
    final List<Map<String, dynamic>> infoUiDatas_normal;
    final List<Map<String, dynamic>> infoUiDatas_scene_context;
    final List<Map<String, dynamic>> infoUiDatas_environment;


    static const List<String> sceneContexts = [
        "zones",
        "road_types",
        "intersections",
        "roundabouts",
        "special_structures"
    ];

    static const List<String> environments = [
        "cloudness",
        "wind",
        "rainfall",
        "snowfall",
        "illuminance",
    ];

    DetailInfoUiData({
        required this.infoUiDatas_normal,
        required this.infoUiDatas_scene_context,
        required this.infoUiDatas_environment,
    });


    factory DetailInfoUiData.fromModel(
        Map<String, dynamic> filters,
        List<model.FilterModel> filterModels,
    ) {

        final List<Map<String, dynamic>> infoUiDatas_normal = [];
        final List<Map<String, dynamic>> infoUiDatas_scene_context = [];
        final List<Map<String, dynamic>> infoUiDatas_environment = [];

        for (var entry in filters.entries) {
            final key = entry.key;
            final value = entry.value;

            final filterModel = filterModels.firstWhere(
                (fm) => fm.category == key,
                orElse: () => throw Exception("FilterModel not found for $key"),
            );

            final valuesList = value is List ? value : [value];
            final List<String> labels = [];

            for (var val in valuesList) {
                final label = _mapEnumValue(filterModel, val).toString();
                labels.add(label);
            }

            List<Map<String, dynamic>> targetList;

            if (sceneContexts.contains(key)) {
                targetList = infoUiDatas_scene_context;
            } else if (environments.contains(key)) {
                targetList = infoUiDatas_environment;
            } else {
                targetList = infoUiDatas_normal;
            }

            if (_specialKeyCheck_Zone(key, labels)) {
                targetList.add({
                    'name': common_functions.snakeToTitleCase(key),
                    'values': _specialKeyCheck_Structures(key, labels),
                });
            }

        }

        return DetailInfoUiData(
            infoUiDatas_normal: infoUiDatas_normal,
            infoUiDatas_scene_context: infoUiDatas_scene_context,
            infoUiDatas_environment: infoUiDatas_environment,
        );
    }

    static String _mapEnumValue(model.FilterModel filterModel, dynamic value) {
        if (value == null) return 'null';

        final entry = filterModel.enums.entries.firstWhere(
            (e) => e.key.toString() == value.toString(),
            orElse: () => throw Exception("Enum not found for value $value in ${filterModel.category}")
        );
        return entry.value;
    }

    static bool _specialKeyCheck_Zone(String key,List<String> labels) {
        if (key == 'zones' && labels.contains('None')) {
            return false;
        }
        return true;
    }

    static List<String> _specialKeyCheck_Structures(String key,List<String> labels) {
        if (key == 'special_structures' && labels.isEmpty) {
            return ['[ ]'];
        }
        return labels;
    }
}