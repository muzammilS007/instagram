import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/ui/main_content/main_content_screen.dart';
import 'package:instagram/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String LOGIN_INFO = "login_info";
List<CameraDescription> cameras = [];

Future<SharedPreferences?> get _prefs async {
  if (await SharedPreferences.getInstance() != null) {
    return await SharedPreferences.getInstance();
  } else {
    return null;
  }
}

Future<void> main() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  bool ping;
  _prefs.then((value) => {
        ping = value?.getBool(LOGIN_INFO) ?? false,
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
