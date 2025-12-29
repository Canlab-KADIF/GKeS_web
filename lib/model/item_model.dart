class ItemModel {
    final String id;
    final List<String> tags;
    final String imageUrl;
    final String? description;

    ItemModel({
        required this.id,
        required this.tags,
        required this.imageUrl,
        this.description,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) {
        return ItemModel(
            id: json['id'],
            tags: json['tags'],
            imageUrl: json['imageUrl'],
            description: json['description'],
        );
    }
}