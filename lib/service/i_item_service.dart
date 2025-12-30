import 'package:abnormal_autonomous_web/model/_model.dart' as model;

abstract class IItemService {
    Future<Map<String, dynamic>> searchItems({
        Map<String, List<int>>? filters,
        int? page,
    });
}