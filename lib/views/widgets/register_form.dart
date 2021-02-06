import 'package:flutter/material.dart';
import 'package:the_afetzede/core/validator/form_validator.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with FormValidator {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  int userId;
  GlobalKey<FormState> _formKey = GlobalKey(debugLabel: "formKey");
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPassword2 = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Container(
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.grey[100]))),
//         child: Column(children:[
//           Container(
//               padding: EdgeInsets.all(8),
//               child: Row(
//                 children:[
//                   Icon(Icons.person_outline),
//                   SizedBox(width: 20),
//                   Flexible(
//                     child: TextFormField(
//                       controller: _controllerName,
//                       validator: validatePassword,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Kullanıcı adı ",
//                           hintStyle: TextStyle(color: Colors.grey[400])),
//                     ),
//                   ),
//                 ],
//               )),
//           Container(
//             padding: EdgeInsets.all(8),
//             child: Row(
//               children: <Widget>[
//                 Icon(Icons.email_outlined),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Flexible(
//                   child: TextFormField(
//                     controller: _controllerEmail,
//                     validator: validateRumuzMail,
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Email",
//                         hintStyle: TextStyle(color: Colors.grey[400])),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//               padding: EdgeInsets.all(8),
//               child: Row(
//                 children: <Widget>[
//                   Icon(Icons.lock_outline),
//                   SizedBox(width: 20),
//                   Flexible(
//                     child: TextFormField(
//                       controller: _controllerPassword,
//                       validator: validatePassword,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Sifre",
//                           hintStyle: TextStyle(color: Colors.grey[400])),
//                       obscureText: _obscureText,
//                     ),
//                   ),
//                   FlatButton(
//                       onPressed: _changeObscureText,
//                       child: Icon(Icons.remove_red_eye))
//                 ],
//               )),
//           Container(
//               padding: EdgeInsets.all(8),
//               child: Row(
//                 children: <Widget>[
//                   Icon(Icons.lock_outline),
//                   SizedBox(width: 20),
//                   Flexible(
//                     child: TextFormField(
//                       controller: _controllerPassword2,
//                       validator: validatePassword,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Sifre tekrar",
//                           hintStyle: TextStyle(color: Colors.grey[400])),
//                       obscureText: _obscureText,
//                     ),
//                   ),
//                   FlatButton(
//                       onPressed: _changeObscureText,
//                       child: Icon(Icons.remove_red_eye))
//                 ],
//               )),
//           _buildButtonContainer(context)
//         ]),
//       ),
//     );
//   }

//   void _changeObscureText() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   Container _buildButtonContainer(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.green[200], borderRadius: BorderRadius.circular(20)),
//       width: MediaQuery.of(context).size.width,
//       child: FlatButton.icon(
//         onPressed: () {
//           if (_formKey.currentState.validate()) {
//             _formKey.currentState.save();
//             print(_controllerName.text);
//             if (_controllerName.text == "ramazan3452") {
//               print("gelmedi");
//               Navigator.pushNamed(context, "/home");
//               preferences.setInt("userId", 3452);
//             } else if (_controllerName.text == "misafir") {
//               Navigator.pushNamed(context, "/home");
//               preferences.setInt("userId", 0);
//             }
//           }
// // print(controllerName.text);
// // print(controllerPassword.text);
// // print(admin);
// // print(user);
//         },
//         icon: Icon(Icons.login),
//         label: Text("Kaydol"),
//       ),
//     );
  }
}
