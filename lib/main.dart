import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/profile_page.dart';
import 'package:mini_sosmed/pages/regis_page.dart';
import 'package:mini_sosmed/pages/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // print(settings.name);
        if (settings.name == LoginPage.routeName && Auth.isLoggedIn()) {
          return MaterialPageRoute(builder: (context) => HomaPage());
        } else {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(.3),
      )),
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
      // home: LoginPage(),
      // home: HomaPage(),
    );
  }
}
