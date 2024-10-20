import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

class AppwriteService {
  late Client _client;
  late Account _account;

  AppwriteService() {
    _client = Client()
      ..setEndpoint('https://cloud.appwrite.io/v1')
      ..setProject('67141f14002aefee6d4d')
      ..setSelfSigned(status: true); // Gunakan hanya dalam pengembangan
    _account = Account(_client);
  }

  Future<models.User> login(String email, String password) async {
    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      final user = await _account.get();
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<models.User> register(String email, String password) async {
    try {
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw e;
    }
  }

  Future<models.User> getCurrentUser() async {
    try {
      return await _account.get();
    } catch (e) {
      throw e;
    }
  }
}
