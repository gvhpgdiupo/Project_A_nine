import 'package:project_a_nine/allapp/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'register.dart';

var id;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff392859),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: [Color(0xff392850), Colors.black])),
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // showLogo(),
                    buildTextFieldEmail(),
                    buildTextFieldPassword(),
                    buildButtonSignIn(),
                    Text('______________________________________'),
                    buildButtonSignUp(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  // Widget showLogo() {
  //   return Container(
  //       width: 130.0, height: 140.0, child: Image.asset('images/logo.png'));
  // }

  // Container buildButtonSignIn() {
  //   return Container(
  //       //constraints: FlatButton.expand(height: 50),
  //       child: Text("Sign in",
  //           textAlign: TextAlign.center,
  //           style: TextStyle(fontSize: 18, color: Colors.white)),
  //       decoration: FlatButton(
  //           borderRadius: BorderRadius.circular(16), color: Colors.green[200], child: null,),
  //       margin: EdgeInsets.only(top: 16),
  //       padding: EdgeInsets.all(12));
  // }

  Widget buildButtonSignIn() => Center(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(top: 16.0),
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: FlatButton(
              color: Colors.blueGrey,
              onPressed: () {
                if (email == null ||
                    email.isEmpty ||
                    password == null ||
                    password.isEmpty) {
                  normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
                } else {
                  checkEmail();
                }
              },
              child: Text(
                'เข้าสู่ระบบ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );

  Widget buildButtonSignUp() => Center(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(top: 10.0),
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: FlatButton(
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text(
                'สมัครสมาชิก',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) {
              email = value.trim();

            },
            decoration: InputDecoration.collapsed(hintText: "Password"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) {
              password = value.trim();
              id =password;

            },
            decoration: InputDecoration.collapsed(hintText: "Password"),
            style: TextStyle(fontSize: 18)));
  }

  Future<void> checkEmail() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((response) {
      //print('Authen Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((response) {
      normalDialog(context, 'ไม่ข้อมูลในระบบ');
    });
  }
}

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            ),
          ],
        ),
      ],
    ),
  );
}
