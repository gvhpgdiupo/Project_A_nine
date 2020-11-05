import 'package:project_a_nine/allapp/home.dart';
import 'package:project_a_nine/allapp/login.dart';
import 'package:project_a_nine/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class Sellcat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SellcatState(),
    );
  }
}

class SellcatState extends StatefulWidget {
  @override
  Sell createState() => Sell();
}

class Sell extends State<SellcatState> {
  @override
  String dates,details;

  final database = FirebaseDatabase.instance.reference();

  Future<Null> regis() async {
    var root = database.child('user');
    root.child(id).update({
      'date': dates,
      'detail': details,

    });
    cond();
    //   MaterialPageRoute route = MaterialPageRoute(
    //     builder: (context) => Login(),
    //   );
    //   Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }




  Widget date() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextField(
          onChanged: (String string) {
            dates = string.trim();
          },
          decoration: InputDecoration(
            helperText: 'จำนวนกิจกรรม',
            labelText: 'กิจกรรม',
          ),
        ));
  }
  Widget detail() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextField(
          onChanged: (String string) {
            details = string.trim();
          },
          decoration: InputDecoration(
            helperText: 'สิ่งที่ต้องทำ',
            labelText: 'กิจกรรม',
          ),
        ));
  }


  Future<void> showAlert(String title, String messages) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(messages),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('susses'))
            ],
          );
        });
  }

  Future<Null> confirm() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('คุณต้องการส่งรายงานใช่หรือไม่'),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                onPressed: () {
                 regis();

                  var rount = MaterialPageRoute(
                      builder: (BuildContext contex) => Home());
                  Navigator.pop(context);
                  cond();
                },
                child: Text('ใช่'),
              ),
              OutlineButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ไม่'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget submit() {
    return Container(
      child: OutlineButton(
        onPressed: () {
          print('You Click Upload');
          if (dates == null ||
              dates.isEmpty ||
              details == null ||
              details.isEmpty ) {
            showAlert('กรุณากรอก', 'ถ่ายรูป หรือ อัพโหลดรูปภาพ');
          } else if (dates == null ||
              dates.isEmpty ||
              details == null ||
              details.isEmpty
          ){
            showAlert('กรุณากรอกข้อมูลให้ครบ', '');
          }  confirm();

            // uploadPictureToStorage();

          // else {
          //   // Upload

          //   // insertValueToFireStore2();
          // }
        },
        textColor: Colors.lightBlueAccent,
        borderSide: BorderSide(
            color: Colors.blue, width: 1.0, style: BorderStyle.solid),
        child: Text(
          'ยืนยัน',
        ),
      ),
    );
  }


  Widget showContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          date(),
          detail(),
          submit(),

        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ฝากขายน้องแมว'),
        ),
        body: Center(

          child: Stack(
            children: <Widget>[
              showContent(),
            ],
          ),
        ),
      ),
    );
  }




  Future<Null> cond() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('คุณได้ทำการอัพโหลดข้อมูลฝากขายน้องแมวเรียบร้อยแล้ว'),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                onPressed: () {
               regis();
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(
                      builder: (BuildContext context) => Home());
                  Navigator.of(context).pushAndRemoveUntil(
                      materialPageRoute, (Route<dynamic> route) => false);
                },
                child: Text('รับทราบ'),
              )
            ],
          )
        ],
      ),
    );
  }
}

