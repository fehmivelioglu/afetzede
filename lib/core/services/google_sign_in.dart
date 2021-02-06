
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:the_afetzede/core/helper/shared_manager.dart';
// import 'package:the_afetzede/core/models/firebase_user_model.dart';

// class GoogleSignHelper {

//    static GoogleSignHelper _instance = GoogleSignHelper._private();
//    GoogleSignHelper._private();
//    static GoogleSignHelper get instance => _instance;
//    final FirebaseAuth _auth = FirebaseAuth.instance;

//    final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

//  Future<GoogleSignInAccount> signIn() async {
//  final user = await _googleSignIn.signIn() ;
//  if(user != null){
//    print(user.email);
//    return user ;
//  }
//  else{
//    return null ;
//  }
// }

//  bool get isHaveUser => user !=null ? true:false ;

//  GoogleSignInAccount get user => _googleSignIn.currentUser  ;

// Future<GoogleSignInAuthentication> googleAuthentica() async {
//   if(await _googleSignIn.isSignedIn()){
//     final user = _googleSignIn.currentUser ;
//     final userData = await user.authentication ;
//     print(userData.accessToken+"hello") ;
//     return userData ;
//   }
//  else{
//    return null ;
//  }
// }

// Future<GoogleSignInAccount> signOut() async {
//  final user = await _googleSignIn.signOut() ;
//  if(user != null){
//    print(user.email);
//    return user ;
//  }
//  else{
//    return null ;
//  }
// }

// Future<FirebaseUser> fireBaseSignin() async {
//   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
//   var tokenResult = await user.getIdToken();
//    await SharedManager.instance.saveString(SharedKeys.TOKEN, tokenResult.token);
//    print(SharedKeys.TOKEN);
//    print(tokenResult.token);
//   print("signed in " + user.displayName);
//   return user;
// }
// }
