import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/ui/main_content/main_content_screen.dart';
import 'package:instagram/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String LOGIN_INFO = "login_info";

Future<SharedPreferences> get _prefs async {
  if (await SharedPreferences.getInstance() != null) {
    return await SharedPreferences.getInstance();
  } else {
    return null;
  }
}

void main() {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  bool ping;
  _prefs.then((value) => {
        ping = value.getBool(LOGIN_INFO) ?? false,
        runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: kPrimaryColor,
            splashColor: kPrimaryColor,
          ),
          home: ping ? MyApp() : LoginScreen(),
        ))
      });
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
