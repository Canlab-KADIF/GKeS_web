class FilterModel {
    final String category;
    final Map<int, String> enums;

    FilterModel({
        required this.category,
        required this.enums,
    });

    factory FilterModel.fromJson(String category, Map<String, dynamic> json) {
        return FilterModel(
            category: category,
            enums: json.map((k, v) => MapEntry(int.parse(k), v.toString())),
        );
    }
}