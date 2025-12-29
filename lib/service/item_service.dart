import 'package:abnormal_autonomous_web/service/i_item_service.dart';

class ItemService implements IItemService {
    @override
    Future<List<Map<String, dynamic>>> fetchAllItems() async {
        await Future.delayed(const Duration(seconds: 1));
        
        print("[Service] - item_service.dart: fetchAllItems");
        return [
            {
                'id': '1',
                'tags': ['tag1', 'tag2'],
                'imageUrl': 'assets/images/1.png',
                'description': 'hi i am seulki',
            },
            {
                'id': '2',
                'tags': ['tag3', 'tag4'],
                'imageUrl': 'assets/images/2.png',
                'description': 'bye bye',
            },
        ];
    }

    @override
    Future<List<Map<String, dynamic>>> searchItems(String keyword) async {
        print("[Service] - item_service.dart: searchItems (keyword: $keyword)");
        final items = await fetchAllItems();
        return items.where((item) => item['description']?.contains(keyword) ?? false).toList();
    }
}