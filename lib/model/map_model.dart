class MapModel {
    final int idx;
    final Map<String, dynamic> dynamic_elements;
    final Map<String, dynamic> scenery;
    final Map<String, dynamic> travel_path;

    MapModel({
        required this.idx,
        required this.dynamic_elements,
        required this.scenery,
        required this.travel_path,
    });

    factory MapModel.fromJson(Map<String, dynamic> json) {
        return MapModel(
            idx: json['idx'],
            dynamic_elements: json['dynamic_elements'],
            scenery: json['scenery'],
            travel_path: json['travel_path'],
        );
    }
}