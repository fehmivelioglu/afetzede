import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../account/login_type.dart';
import '../account/my_account.dart';

dynamic appBar(context) => AppBar(
      title: Row(
        children: [
          Container(
            height: 65,
            width: 75,
            child: Image(
              image: AssetImage('assets/appbar_logo_copy.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Text('AFETZEDE')
        ],
      ),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            FirebaseAuth.instance.authStateChanges().listen((User user) {
              if (user == null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginType()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccountPage()));
                ;
              }
            });
          },
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.red,
    );

final fabButton = FabCircularMenu(
  fabCloseColor: Colors.green,
  // fabOpenColor: Colors.green,
  fabColor: Colors.red,
  ringColor: Colors.red,
  fabOpenIcon: Icon(Icons.phone),
  children: [
    FlatButton.icon(
      icon: FaIcon(
        FontAwesomeIcons.starAndCrescent,
        color: Colors.black,
      ),
      label: Text(
        'KIZILAY 168',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () {
        callUrgent('168');
      },
    ),
    FlatButton.icon(
      icon: FaIcon(
        FontAwesomeIcons.ambulance,
        color: Colors.black,
      ),
      label: Text(
        '112 ACİL',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () {
        callUrgent('112');
      },
    ),
    FlatButton.icon(
      icon: FaIcon(FontAwesomeIcons.handsHelping, color: Colors.black),
      label: Text(
        'AFAD 122 ',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () {
        callUrgent('122');
      },
    ),
    FlatButton.icon(
      icon: FaIcon(
        FontAwesomeIcons.burn,
        color: Colors.black,
      ),
      label: Text(
        '110 İTFAİYE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () {
        callUrgent('110');
      },
    ),
  ],
);

dynamic callUrgent(String number) {
  launch('tel://${number}');
}
