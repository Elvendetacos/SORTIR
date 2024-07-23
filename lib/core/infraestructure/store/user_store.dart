import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  Future<void> setJwtToken(String jwtToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', jwtToken);
    print('JWT Token saved: $getJwtToken()');
  }

  Future<String?> getJwtToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }

  Future<void> setId(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  Future<int?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }
}