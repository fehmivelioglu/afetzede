import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/account/register.dart';

import '../../../core/services/sign_in_service.dart';
import '../home/homeView.dart';

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();
final email = TextFormField(
  controller: t1,
  keyboardType: TextInputType.emailAddress,
  autofocus: false,
  decoration: InputDecoration(
    icon: Icon(Icons.email),
    hintText: 'E-Posta',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

final password = TextFormField(
  controller: t2,
  autofocus: false,
  obscureText: true,
  decoration: InputDecoration(
    icon: Icon(Icons.lock),
    hintText: 'Şifre',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

final loginButton = Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  // ignore: deprecated_member_use
  child: RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    onPressed: () {
      print('giriş yapıldı');
    },
    padding: EdgeInsets.all(12),
    color: Colors.lightBlueAccent,
    child: Text('Giriş Yap', style: TextStyle(color: Colors.white)),
  ),
);

dynamic girisButton(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    // ignore: deprecated_member_use
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        girisYap(t1.text, t2.text);
        print('giriş yapıldı');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('GirişYap', style: TextStyle(color: Colors.white)),
    ),
  );
}

dynamic createAcc(context) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      'Hesabınız yok mu? Hesap Oluşturun',
      style: TextStyle(color: Colors.black54),
    ),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterView()));
    },
  );
}
