import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                child: Text('Kayıt Ol'))
          ],
        ),
      ),
    );
  }
}

kayitOl(String email, String pass) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass);
}
