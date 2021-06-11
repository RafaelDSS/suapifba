import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreRepository {
  void saveDataLogin(String? matricula, String? password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('logindata', ['$matricula', '$password']);
  }

  Future<List<String>?> getDataLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dataLogin = prefs.getStringList('logindata');
    return dataLogin;
  }

  void saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
