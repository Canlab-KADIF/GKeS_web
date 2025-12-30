import 'package:abnormal_autonomous_web/model/_model.dart' as model;

abstract class IItemService {
    Future<List<Map<String, dynamic>>> searchItems({
        Map<String, List<int>>? filters,
    });
}