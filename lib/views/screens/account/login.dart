import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/viewmodels/login_viewmodels.dart';

import '../viewmodels/login_viewmodels.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            girisButton(context),
            createAcc(context),
          ],
        ),
      ),
    );
  }
}
