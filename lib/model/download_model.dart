class DownloadModel {
    final List<String> list;

    DownloadModel({
        required this.list,
    });

    factory DownloadModel.fromJson(Map<String, dynamic> json) {
        return DownloadModel(
            list: (json['files'] as List<dynamic>)
                .map((e) => e.toString())
                .toList(),
        );
    }
}