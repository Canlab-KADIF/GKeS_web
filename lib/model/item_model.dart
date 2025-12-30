class ItemModel {
    final Map<String, dynamic> filters;
    final Map<String, dynamic> data_paths;

    ItemModel({
        required this.filters,
        required this.data_paths,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) {
        return ItemModel(
            filters: json['filters']..remove('id')..remove('created_at'),
            data_paths: json['data_paths'],
        );
    }
}