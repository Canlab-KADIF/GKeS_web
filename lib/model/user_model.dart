class UserModel {
    final String id;
    final String pw;
    final String? name;

    UserModel({
        required this.id,
        required this.pw,
        this.name,
    });

    UserModel copyWith({
        String? id,
        String? pw,
        String? name,
    }) {
        return UserModel(
            id: id ?? this.id,
            pw: pw ?? this.pw,
            name: name ?? this.name,
        );
    }
}