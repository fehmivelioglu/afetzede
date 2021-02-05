import 'package:flutter/material.dart';
import 'views/screens/home/homeView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFETZEDE',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
      },
    );
  }
}
