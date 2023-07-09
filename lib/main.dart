import 'package:flutter/material.dart';
import 'package:mini_sosmed/pages/home_page.dart';
import 'package:mini_sosmed/pages/login_page.dart';
import 'package:mini_sosmed/pages/regis_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // color: Color.fromARGB(255, 240, 242, 245),
      color: Colors.grey,
      home: HomaPage(),
    );
  }
}