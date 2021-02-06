import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/account/login_signin.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdasdsad'),
      ),
      body: Container(
          child: ElevatedButton(
        child: Text('Kayıt Ol'),
        onPressed: () => LoginPage,
      )),
    );
  }
}
