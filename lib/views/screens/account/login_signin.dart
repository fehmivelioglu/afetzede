import 'package:flutter/material.dart';
import 'package:the_afetzede/core/services/sign_in_service.dart';
import 'package:the_afetzede/views/screens/account/login_type.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final TextEditingController t1 = TextEditingController();
final TextEditingController t2 = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 500) {
      screenHeight = 500;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                // ignore: unnecessary_new
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: AssetImage('assets/bg.png'))),
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            ElevatedButton(
              onPressed: () => kayitOl(t1.text, t2.text),
              child: Text('Kayıt Ol'),
            ),
            ElevatedButton(
              onPressed: () => girisYap(t1.text, t2.text),
              child: Text('Giriş Yap'),
            ),
            ElevatedButton(
              onPressed: () => signInWithGoogle(),
              child: Text('Google İle Kayıt Ol'),
            ),
            ElevatedButton(
              onPressed: () => signOut(),
              child: Text('Çıkış Yap'),
            ),
            ElevatedButton(
              onPressed: () {
                printUid();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginType()));
              },
              child: Text('UID'),
            )
          ],
        ),
      ),
    );
  }
}