import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/account/login_signin.dart';
import 'views/screens/home/homeView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

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
