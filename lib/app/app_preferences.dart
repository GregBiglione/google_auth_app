import 'package:google_auth_app/app/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  //----------------------------------------------------------------------------
  // Set preferences for user logged
  //----------------------------------------------------------------------------

  Future<void> setUserLogged() async {
    _sharedPreferences.setBool(IS_USER_LOGGED, true);
  }

  //----------------------------------------------------------------------------
  // Get preferences for user logged
  //----------------------------------------------------------------------------

  Future<bool> isUserLogged() async {
    return _sharedPreferences.getBool(IS_USER_LOGGED) ?? false;
  }
}