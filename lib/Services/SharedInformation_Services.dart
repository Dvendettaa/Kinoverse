import 'package:shared_preferences/shared_preferences.dart';

class SharedInformation {
  String? _email;
  String? _password;
  bool? _isUser;

  Future<bool?> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('email');
    _password = prefs.getString('password');

    if (_password == null || _email == null) {
      _isUser = false;
    } else
      _isUser = true;

    return _isUser;
  }

  Future<String?> getUserEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }
}