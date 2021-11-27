import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lopez_store_app/models/user_model.dart';

class UserService {
  final _storage = new FlutterSecureStorage();
  bool cargando = false;
  List<dynamic> myCartProducts = [];
  static Future<dynamic> getUserStorage() async {
    final _storage = new FlutterSecureStorage();

    final userId = await _storage.read(key: 'id_cliente');
    final userName = await _storage.read(key: 'nombre');
    final userPass = await _storage.read(key: 'clave');
    final userEmail = await _storage.read(key: 'email');
    final userPhone = await _storage.read(key: 'telefono');

    if (userId != null) {
      User user = new User(
          userId: userId,
          userName: userName,
          userEmail: userEmail,
          userPass: userPass,
          userPhone: userPhone);
      return user;
    } else
      return null;
  }

  static Future<void> deleteUserStorage() async {
    final _storage = new FlutterSecureStorage();
    await _storage.deleteAll();
  }

  Future<void> saveUserStorage(User user) async {
    await _storage.write(key: 'user_id', value: user.userId);
    await _storage.write(key: 'user_name', value: user.userName);
    await _storage.write(key: 'user_email', value: user.userEmail);
    await _storage.write(key: 'user_pass', value: user.userPass);
    await _storage.write(key: 'user_phone', value: user.userPhone);
  }
}
