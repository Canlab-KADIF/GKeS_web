abstract class IAuthService {
  Future<String?> login(String id, String pw);
}