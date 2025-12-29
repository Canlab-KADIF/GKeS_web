class UserModel {
    final String id;
    final String pw;
    final String? name;
    
    UserModel({
        required this.id,
        required this.pw,
        this.name,
    });

    UserModel copyWith({String? name}) {
        return UserModel(
            id: id,
            pw: pw,
            name: name ?? this.name,
        );
    }
}