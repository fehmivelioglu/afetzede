import 'package:firebase_auth/firebase_auth.dart';

kayitOl(String email, String pass) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass);
}

googleKayitOl() {}
