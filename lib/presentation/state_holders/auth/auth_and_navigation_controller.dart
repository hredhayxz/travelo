import 'package:shared_preferences/shared_preferences.dart';

class AuthAndNavigationController {
  static String? _accessToken;
  static bool? _isFirstTimeOpening;

  static String? get accessToken => _accessToken;

  static bool? get isFirstTimeOpening => _isFirstTimeOpening;

  static Future<void> setAppInstallValue(bool val) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool('is_first_time', val);
    _isFirstTimeOpening = val;
  }

  static Future<void> getAppInstallValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isFirstTimeOpening = sharedPreferences.getBool('is_first_time');
  }

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static bool get isLoggedIn {
    return _accessToken != null;
  }
}
