import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/home/home_screen.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/ui/main_content/main_content_screen.dart';
import 'package:instagram/utils/share_pref.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF011723,
  const <int, Color>{
    50: const Color(0xFF011723),
    100: const Color(0xFF021218),
    200: const Color(0xFF021218),
    300: const Color(0xFF021218),
    400: const Color(0xFF021218),
    500: const Color(0xFF021218),
    600: const Color(0xFF021218),
    700: const Color(0xFF021218),
    800: const Color(0xFF021218),
    900: const Color(0xFF021218),
  },
);

class MyApp extends StatelessWidget {
  SharePref _sharePref = SharePref();

  @override
  Widget build(BuildContext context) {
    _sharePref.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        splashColor: kPrimaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black),
        ),
        body: FutureBuilder<bool>(
          future: _sharePref.getLoginStatus(),
          builder: (context,snapshot){
             if(snapshot.hasData)
               {
                 return snapshot.data ? MainContent()  :  LoginScreen();
               }
             else{
               return LoginScreen();
             }

          },
        ),
      ),
    );
  }
}
