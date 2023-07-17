import 'package:flutter/material.dart';
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Auth.setAuth(
        //     '46|1xtMTBH7vQlDehn10VWdIw5YKL4uomQnjyNWw2GV',
        //     '1',
        //     'Ahmad Ikbal Djaya',
        //     'ahmad-ikbal-djaya',
        //     'profile-images/defaultProfile.png');
        if (Auth.isLoggedIn()) {
          return MaterialPageRoute(builder: (context) => HomaPage());
        } else {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(.3),
        ),
      ),
      debugShowCheckedModeBanner: false,
      color: Colors.grey,
    );
  }
}
