import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/home/home_screen.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/ui/main_content/main_content_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        splashColor: kPrimaryColor,
      ),
      home: LoginScreen(),
/*      builder: (context, widget) =>
          ResponsiveWrapper.builder(LoginScreen(),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: Color(0xFFF5F5F5))),*/
    );
  }
}
