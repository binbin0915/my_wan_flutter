import 'package:flutter/material.dart';
import 'package:mywanflutter/view/main/mian_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '玩安卓-Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        backgroundColor: Colors.grey,
        accentColor: Color(0xFF26A69A),
        dividerColor: Colors.blueGrey,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ),
      home: MainPage(),
      routes: {},
    );
  }
}

