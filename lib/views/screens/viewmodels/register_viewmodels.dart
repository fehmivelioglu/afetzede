import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/core/services/sign_in_service.dart';
import 'package:the_afetzede/views/screens/account/choose_preferences.dart';
import 'package:the_afetzede/views/screens/account/login.dart';

import '../../../core/models/user_model.dart';
import '../../../core/services/realtime_db_service.dart';
import '../home/homeView.dart';

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();
TextEditingController t3 = TextEditingController();
String oncelikDeger = '1';
String lokasyonDeger = 'Mahalle Seçiniz';
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

dynamic registerButton(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    // ignore: deprecated_member_use
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        kayitOl(t1.text, t2.text);
        print('giriş yapıldı');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChooseView()));
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Hesap Oluştur', style: TextStyle(color: Colors.white)),
    ),
  );
}

dynamic registerComplete(context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    // ignore: deprecated_member_use
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        var model = UserModel(
          uid: FirebaseAuth.instance.currentUser.uid,
          userName: t3.text,
          oncelik: oncelikDeger,
          place: lokasyonDeger,
        );

        await RealTimeDBService.getInstance().postUser(model);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Hesap Oluşturmayı Tamamla',
          style: TextStyle(color: Colors.white)),
    ),
  );
}

dynamic createAcc(context) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      'Zaten hesabınız var mı? Giriş Yapın',
      style: TextStyle(color: Colors.black54),
    ),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginView()));
    },
  );
}

final userName = TextFormField(
  controller: t3,
  keyboardType: TextInputType.emailAddress,
  autofocus: false,
  decoration: InputDecoration(
    icon: Icon(Icons.person),
    hintText: 'İsminiz',
    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

dynamic grupAciklama(context) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      'Ait olduğunuz grubu öğrenmek için tıklayın.',
      style: TextStyle(color: Colors.black87),
    ),
    onPressed: () {
      print('alert');
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Öncelik Grupları Hakkında'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('0. Grup : 18-45 yaşlarındaki sağlıklı vatandaşlar.'),
                  Text('1. Grup : 0-10 ve 65+ yaşlarındaki tüm vatandaşlar.'),
                  Text(
                      '2. Grup : 11-17 ve 45-64 yaşlarındaki kronik rahatsızlığı bulunan vatandaşlar.'),
                  Text(
                      '3. Grup : 18-45 yaşlarındaki kronik rahatsızlığı bulunan vatandaşlar.'),
                  Text(
                      '4. Grup : 11-17 ve 45-64 yaşlarındaki sağlıklı vatandaşlar.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Tamam'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}

var oncelikItems = ['0. Grup', '1. Grup', '2. Grup', '3. Grup', '4. Grup'];
// ignore: prefer_single_quotes
var lokasyonItems = ["1. Mahalle", "2. Mahalle", "3. Mahalle"];
