import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:the_afetzede/views/screens/account/login.dart';
import 'package:the_afetzede/views/screens/account/register.dart';

class LoginType extends StatefulWidget {
  @override
  _LoginTypeState createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginType> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 500) {
      screenHeight = 500;
    }
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: AssetImage("assets/bg.jpg"))),
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCenterText(),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 0.2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: [
                    _buildFlatButton('Kayıt ol','Register'),
                    _buildFlatButton('Eposta ile giris yap','Login'),
                    _buildFlatButton('Google ile Giris yap','-'),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  FlatButton _buildFlatButton(String title,String process) {
    return FlatButton.icon(
      onPressed: () {
        if(process == 'Login'){   
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
        }
        else if(process == 'Register'){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterView()));
        }
       
      },
      icon: Icon(Icons.login),
      label: Text(title),
    );
  }

  Column _buildCenterText() {
    return Column(
      children: [
        Center(
          child: AutoSizeText(
            'Hoşgeldiniz !',
            maxLines: 1,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: AutoSizeText(
            'Devam etmek için giriş yapmalısınız',
            maxLines: 1,
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        )
      ],
    );
  }
}
