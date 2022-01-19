import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  SharedPreferences? prefs;

   final String LOGIN_INFO = "login_info";
   final String userId = "userId";

  void initialize() async {
   // prefs = await SharedPreferences.getInstance();
  }

  Future<void> setLoginStatus(var flag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LOGIN_INFO, flag);
  }

  Future<void> setUserId(var userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userId, userid);
  }

  Future<bool>  getLoginStatus()  async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     //Return bool
     bool boolValue = prefs.getBool(LOGIN_INFO) ?? false;
    return  boolValue;

  }
  Future<String>  getUserId()  async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     //Return bool
     var boolValue = prefs.getString(userId) ?? "";
    return  boolValue;

  }
}
