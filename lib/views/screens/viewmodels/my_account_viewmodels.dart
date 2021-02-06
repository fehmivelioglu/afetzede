import 'package:flutter/material.dart';

import '../../../core/services/sign_in_service.dart';

dynamic signOutButton(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    // ignore: deprecated_member_use
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        signOut();
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Çıkış Yap', style: TextStyle(color: Colors.white)),
    ),
  );
}
