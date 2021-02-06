import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

dynamic kayitOl(String email, String pass) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: pass);
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

dynamic signOut() async {
  await FirebaseAuth.instance.signOut();
}

dynamic printUid() {
  String x;
  x = FirebaseAuth.instance.currentUser.uid;
  print(x);
}
