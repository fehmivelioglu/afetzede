import 'package:flutter/material.dart';
import 'package:the_afetzede/core/services/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final TextEditingController t1 = TextEditingController();
final TextEditingController t2 = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              onPressed: () => signInWithGoogle(),
              child: Text('Google İle Kayıt Ol'),
            ),
            ElevatedButton(
              onPressed: () => signOut(),
              child: Text('Çıkış Yap'),
            ),
            ElevatedButton(
              onPressed: () => printUid(),
              child: Text('UID'),
            ),
          ],
        ),
      ),
    );
  }
}
