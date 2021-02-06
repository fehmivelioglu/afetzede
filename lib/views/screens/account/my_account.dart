import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/viewmodels/my_account_viewmodels.dart';

import '../viewmodels/register_viewmodels.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
            Text('userName'),
            SizedBox(height: 24.0),
            signOutButton(context),
          ],
        ),
      ),
    );
  }
}
