class AuthService {
    Future<String?> login(String id, String pw) async {
        await Future.delayed(const Duration(seconds: 1));

        if (id == 'admin' && pw == '1234') {
            return 's1k2';
        } else {
            return null;
        }
    }
}