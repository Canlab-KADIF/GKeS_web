class FilterModel {
    final String db_column;
    final Map<String, String> enums;

    FilterModel({
        required this.db_column,
        required this.enums,
    });

    factory FilterModel.fromJson(Map<String, dynamic> json) {
        return FilterModel(
            db_column: json['db_column'],
            enums: Map<String, String>.from(json['enum']),
        );
    }
}